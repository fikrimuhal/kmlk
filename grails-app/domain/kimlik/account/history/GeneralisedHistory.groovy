package kimlik.account.history

class GeneralisedHistory {
    static embedded = ['history']

    Set<HistoryEntity> history = new LinkedHashSet<>()

    static constraints = {
        history nullable: true
    }

    HistoryEntity getLastEntity() {
        if (history.size())
            history.sort { -(it.startDate?.time?:0) }[0]
    }
}
