define [

    "game/views/stage"
    "game/controllers/square"
    
] , (
    
    StageView
    SquareController
    
) ->
    
    App = ( prop ) ->
        
        window.game =
            
            stage: new StageView
            square: new SquareController
            
            start: ->
                i = 0
                run = [ 
                    "stage"
                    "square"
                ]
                
                while i < run.length
                    game[ run[ i ] ].init()
                    i++
          
        game.start()