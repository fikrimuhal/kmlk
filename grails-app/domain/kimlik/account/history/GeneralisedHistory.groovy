package kimlik.account.history

import kimlik.account.SocialMeta

class GeneralisedHistory {
    static embedded = ['history']

    Set<HistoryEntity> history = new LinkedHashSet<HistoryEntity>()

    static constraints = {
        history nullable: true
    }

    HistoryEntity getLastEntity() {
        if (history.size())
            history.sort { -(it.startDate?.time ?: 0) }[0]
    }


    static hasMany = [
            history: HistoryEntity,
    ]


    HistoryEntity findBySocial(SocialMeta meta) {
        return history.find {
            return it.socialMeta.upstreamId == meta.upstreamId && it.socialMeta.source == meta.source
        }
    }

    /**
     * socialMeta.upstreamId ve socialMeta.source dolu olmasi lazim
     * @return true if something is changed
     */
    Boolean updateOrAdd(HistoryEntity historyEntity) {
        assert historyEntity?.socialMeta?.source
        assert historyEntity?.socialMeta?.upstreamId

        boolean isChanged = false

        def oldEntity = findBySocial(historyEntity.socialMeta)
        if (oldEntity) {
//            println '****** oldEntity bulundu'
            if (oldEntity.socialMeta.updateFromUpStreamAllowed) {
//                println '****** updateAllowed update et'
                oldEntity.socialMeta.upstreamFetchDate = historyEntity.socialMeta.upstreamFetchDate

                oldEntity.copyFieldsFrom(historyEntity)
                isChanged = true
            } else {
//                println '****** update e izinverilmedi'
                // update e izin verilmedi(kullanici editlemis mesela) update etmeyecegiz
            }
        } else {
//            println '****** yeni kayit olustur oldentity yok'
            //yeni kayit olusturalim
            history.add(historyEntity)
//            println historyEntity.socialMeta.dump()
            isChanged = true
        }
        return isChanged
    }

}
