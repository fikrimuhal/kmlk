/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:41 PM
 * To change this template use File | Settings | File Templates.
 */

CTRL.controller('IdeaCtrl', ['$scope', '$resource', 'IdeaService', '$rootScope', 'ProfileService', '$storage', function ($scope, $resource, IdeaService, $rootScope, ProfileService, $storage) {
    console.log("IdeaController initialize");


    $scope.ideas = {};
    $scope.tags = [];


//    -------------------Ideas------------------

    function updateIdeas() {
        var result = IdeaService.reloadCache();
        $scope.ideas = result;
    }


    $scope.submitIdea = function () {
        var ideaInput = $scope.ideaInput;

        if (!ideaInput || 10 > ideaInput.length) {
            alert("Öneriniz çok kısa!");
            return false
        }
        if (140 < ideaInput.length) {
            alert("Öneriniz 140 karakterden daha fazla!");
            return false
        }
        var result = IdeaService.save({}, {text: $scope.ideaInput}, function () {
            $scope.ideaInput = null;
            if (result.data) {
                extendIdea(result.data)
                $scope.ideas.data.unshift(result.data);
                highlight(result.data);
            }
        }, function (error) {
            var m = error.data.message;
            var s = error.data.status;
            var c = error.data.code;
            var hc = error.code;

            var d = error.data.data; //should be emty

            //todo : facebook ile login yapmayi dene yada pop up cikar
            alert(m);
            console.log(error);
        });

        //updateIdeas(); //todo api eger yeni idea yi kaydederse id sini yada kendisini dondurmeli boylece tek sorguda update ederiz.
    };

    $scope.clearItem = function (item) {
        var idx = $scope.ideas.indexOf(item);
        if (idx !== -1) {
            //injected into repeater scope by fadey directive
            this.destroy(function () {
                $scope.ideas.splice(idx, 1);
            });
        }
    };
    updateIdeas();

    /**
     * @Deprecated
     * @param row
     * @returns {boolean}
     */
    $scope.searchIdea = function (row) {
        var text = row.text.toLowerCase();
        var filterText = $scope.ideaInput;
        if (!filterText || filterText.length < 1) {  //minimum 3 chars to pass
            console.log('x');
            return true;
        } else {
            filterText = filterText.toLowerCase();
            var tokens = filterText.split(/\b\s+/);
            console.log('tokens------>', tokens);
            for (var token in tokens) {
                //noinspection JSUnfilteredForInLoop
                console.log(tokens[token]);
            }
            // console.log(text.search(filterText));
            return   !(text.search(filterText) === -1); //                          false

        }


    };


//    -------------------Tags------------------

    var _mockTagStore = getMockTags();

    function updateTags() {
        $scope.tags = _mockTagStore;    //Bu array copy mi yapmali acaba?
    }

    $scope.ideaTagFilter = '';
    $scope.selectTag = function (tag) {
        if (tag) {
            $scope.ideaTagFilter = tag.title || tag;

        } else {
            $scope.ideaTagFilter = '';
        }
    };


    updateTags();


//  ================================BUTTONS===================================
    $scope.supportBtn = function (idea) {
        IdeaService.vote.up(idea, $scope)
    }

    $scope.passBtn = function (idea) {
        IdeaService.vote.down(idea, $scope)
    }

    $scope.reportBtn = function (idea) {
//        IdeaService.reportBadContent(idea);
        alert('FIX ME!!!')
        ProfileService.votedIdeas()
        //todo: votedIdealari al
        //todo: gec e basilmis olanlari bul
        //todo: up verilmis olanlari bul
        //todo: cache e oy durumunuda ekle (extend et)
        //todo: view cache den gec e basilmis olanlari cikart. yada filter kullan
    }

    /**
     * Requires administrative privileges
     * @param idea
     */
    $scope.deleteBtn = function (idea) {
        var ok = confirm('! "' + idea.text+ ' "Silmek istediginden emin misin?')
        if (ok) {
            IdeaService.delete(idea);
        }
    }

//  ================================highlight===================================

    $scope.isHighlighted = function (idea) {
        return _highlightedIdea && _highlightedIdea.id === idea.id;
    }

    var _highlightedIdea;
    //alert('merhabaaa')
    function highlight(idea) {
        _highlightedIdea = idea;
    }

    $scope.highlight = highlight;

//
//    $scope.$watch('ideas', function (x) {
//        console.log('watchwatchwatchwatchwatch', x);
//        move2Top();
//    });
    var move2Top = function () {
        var ideas = $scope.ideas
        console.log('watchwatchwatchwatchwatch', ideas);
        var id = $scope.stateParams.ideaId;
        var result = ideas.data.filter(function (idea) {
            console.log(idea);
            return idea.id == id
        });
        console.debug('$scope._selectedIdeaId==============: ', result)

////
    }
//  ==============================DISPLAY AT TOP================================
    $scope.$on('$stateChangeSuccess',
        function (event, toState, toParams, fromState, fromParams) {
            var toParams = toParams;
            $scope.stateParams = toParams
            var id = $scope.stateParams.ideaId;
            if (id !== undefined) {
                IdeaService.get({id: id}, function (result) {

                    var newIdea = result.data
                    var ideas = $scope.ideas.data
                    mergeIdeas(newIdea, ideas)

                    newIdea._order = 999999999999999;
                    highlight(newIdea);

                })
            }
        });

//------------------------------------------------------------------------------------------------------------------
    var settings = $storage('settings');
    $scope.settings = {
        skipIdeaTutorial: {
            get: function () {
                return settings.getItem('skipIdeaTutorial')
            },
            set: function (value) {
                settings.setItem('skipIdeaTutorial', value)
            }
        }
    }

}]);


//------------------------------------------------------------------------------------------------------------------
/**
 * Demo Idea
 *
 * 1-
 */
function startIntro() {
    var intro = introJs();
    intro.setOptions({
        steps: [
            {
                element: $("#ideaContainer li").eq(1)[0],
                intro: "This is a tooltip."
            },
            {
                element: $("#ideaContainer li").eq(2)[0],
                intro: "Ok, wasn't that fun?",
                position: 'right'
            },
            {
                element: '#t-3',
                intro: 'More features, more fun.',
                position: 'left'
            },
            {
                element: $("#ideaContainer").find("li:first-child"),
                intro: "Another step.",
                position: 'bottom'
            }
        ]
    });

    intro.start();
}
//------------------------------------------------------------------------------------------------------------------

