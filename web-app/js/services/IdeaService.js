/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/13/13
 * Time: 4:05 AM
 * To change this template use File | Settings | File Templates.
 */

SRVC.factory('IdeaService', function ($resource, $rootScope, ProfileService) {
    var ideaResource = $resource('/api/1/idea/:id/:verb', {id: '@id'},
        {
            'get': {method: 'GET'},
            'save': {method: 'PUT'},
            'query': {method: 'GET', isArray: false, params: {}},
            'remove': {method: 'DELETE'},
            'delete': {method: 'DELETE'},
            'voteReset': {method: 'POST', params: {verb: 'vote', value: 0}},
            'vote': {method: 'POST', params: {verb: 'vote'}},
            'voteDown': {method: 'POST', params: {verb: 'vote', value: -1}}

        });

    //todo: not implememnted yet FIX ME!!
    if (false && ProfileService.isLoggedIn) {
        ProfileService.votedIdeas({}, function (result) {
            cachedVoteLog.data = result.data;
            console.log(cachedVoteLog)

        });
    }


    var cachedVoteLog = {data: []}
    var cachedResponse = {//todo: delete me!!! or implement me! or do something!!!
        data: [
//            {
//                id: 0,
//                text: 'From Amsterdam to Abu Dhabi, Brisbane to Birmingham, Caracas to Lagos, Rio de Janiero to Surfer’s Paradise, it takes a genius to build community that lasts.',
//                author: {id: 1},
//                vote: {
//                    up: 11,
//                    down: 3,
//                    score: 8
//                },
//                tags: ['çevre', 'ekonomi', 'sanat', 'TODO:CACHE'],
//                _order: 5
//
//            }
        ]
    };

    function _query(onSuccess) {


        // Get the resource reference (at this point,
        // it is an empty array or object reference).
        var results = ideaResource.query({}, function () {
            extendIdeas(results.data, cachedVoteLog);
            mergeIdeas(results.data, cachedResponse.data);

            if (onSuccess) {
                onSuccess.call();
            }

        });

        // Before we return the resource, let's inject
        // our own cache. Since the Resource *always*
        // updates on the next "tick", we know that we
        // are not going to corrupt the true response
        // from the server.
        return(
            applyCacheToResource(results, cachedResponse)
            );

    }

    return {

        /**
         * @Deprecated
         * @param onSuccess
         * @returns {*}
         */
        query: _query,
        save: ideaResource.save,
        get: ideaResource.get,
        vote: {
            up: function (idea, scope) {
                var idea = idea;
                //Resource.action([parameters], postData, [success], [error])
                ideaResource.vote({id: idea.id}, {value: 1}, function (response) {     //todo: params daki value yu sil
                    var updatedIdea = response.data
                    mergeIdea(updatedIdea, cachedResponse.data)   //todo: update local cache not scope
                    // clearItem(updatedIdea, scope.ideas.data)   //todo: update local cache not scope
                });
            },
            down: function (idea, scope) {
                var idea = idea;
                ideaResource.vote({id: idea.id}, {value: -1}, function (response) {
                    var updatedIdea = response.data
                    mergeIdea(updatedIdea, cachedResponse.data)   //todo: update local cache not scope
                    // clearItem(updatedIdea, scope.ideas.data)   //todo: update local cache not scope
                    console.log(updatedIdea);
                });

            },
            reset: function (idea) {
                var idea = idea;
                ideaResource.vote({id: idea.id}, {value: 0}, function (response) {
                    var updatedIdea = response.data
                    console.log(updatedIdea);
                });
            }
        },
        reportBadContent: function (idea) {
            //todo send to server
            alert('bad content');
        },
        delete: function (idea) {
            var params = {id: idea.id}

            function onSuccess() {
//                alert('ok')
            }

            function onError() {
                alert('error')
            }

            //todo remove from cache
            var cache = cachedResponse.data
            console.log(cache)
            var idx = _.findIndex(cache, function (it) {
                return it.id == idea.id;
            });
            //alert(idx)
            cache.splice(idx,1)

            ideaResource.delete({}, params, onSuccess, onError);
        },
        reloadCache: function () {
//            setTimeout(function () {
//                cachedResponse.data.push({"author": {"id": 2},
//                    "id": -1,
//                    "text": "exampleidea",
//                    "tags": ['TODO:CACHE'],
//                    "upVotes": 0,
//                    "downVotes": 0,
//                    "voteScore": 0,
//                    "created": "2013-07-12T15:45:38Z",
//                    "updated": "2013-07-12T15:45:38Z",
//                    _order: 14
//                });
//                // $rootScope.$apply();
//
//            }, 500);
            _query();
            return cachedResponse;

            //Todo: query database
            //Todo:     update localCache with result
            //Todo:     order data
            //Todo:
            //Todo:     update scope with localCache
        }
    }
});

function clearItem(item, localCache) {
    var idx = localCache.indexOf(item);
    if (idx !== -1) {
        localCache.splice(idx, 1);
    }
}

/**
 *
 * @param newData idea(s) to be merged with localCache. if newData has same objects with localCache it will replace oldOne
 * @param localCache $scope.ideas.data yada cachedResponse.data
 */
function mergeIdeas(newData, localCache) {

    var ideas = localCache;
    var newIdea
    if (angular.isArray(newData)) {
        for (var idx in newData) {
            newIdea = newData[idx]
            mergeIdea(newIdea, ideas);
        }
    } else {
        newIdea = newData;
        mergeIdea(newIdea, ideas);
    }

}

function mergeIdea(newIdea, localCache) {
    var ideas = localCache;
    var foundIDX;

    extendIdea(newIdea)

    //Search newIdea in cache
    for (var idx in ideas) {
        var idea = ideas[idx];
        if (idea.id == newIdea.id) {
            foundIDX = idx;
        }
    }

    if (foundIDX) {
        //cache has (possibly)old version of idea, so replace it with the one
        ideas[foundIDX] = newIdea;
    } else {
        //idea is new in Cache: add the new one
        ideas.push(newIdea);
    }
}

function extendIdeas(items, ideaVoteLog) {
    var items = items

    function extendIdeaWithVoteLog(item) {
        var item = item

        if (item.getVoteLog === undefined) {
            item.getVoteLog = function () {
                var foundIDX;
                var voteLog = ideaVoteLog.data;
                for (var idx in voteLog) {
                    var log = voteLog[idx];
                    if (log.idea.id == item.id) {
                        foundIDX = idx;
                    }
                }
//                console.log('VOTE LOG :: ', voteLog)
                return false || foundIDX;
            }
        }
    }

    for (var idx in items) {
        extendIdea(items[idx]);
        extendIdeaWithVoteLog(items[idx]);
    }
}

function extendIdea(item) {
    var item = item

    if (item._order === undefined) {
        item._order = item.id;
    }
}