define ->
    
    class SquareController
    
        init: ->
            @.getElements()
            @.randomWalk(2000,1) #rateChange, spee
            @.animate()
        
        getElements: ->
            @.square = {
                scale: 100
                color: "#000000"
                pos:
                    x: window.innerWidth / 2
                    y: window.innerHeight / 2
                    r: 0
                points: [
                    x: 1
                    y: 1
                ,
                    x: -1
                    y: 1
                ,
                    x: -1
                    y: -1
                ,
                    x: 1
                    y: -1
                ,
                    x: 1
                    y: 1
                ]
            }
            
            game.stage.render( @.square )
            
        ease: ( current , target ) ->
            output = 0
            if Math.abs( target - current ) > 1
                output = current + (( target - current ) / 5 )
                
            return output
        
        randomWalk: (rateChange,spd) ->
            @.speed = spd
            setInterval =>
                @.direction = Math.floor( Math.random() * 4 )
            , rateChange
                
        animate: ->
            setInterval =>
                switch @.direction
                    when 0 then @.square.pos.x += @.speed
                    when 1 then @.square.pos.x -= @.speed
                    when 2 then @.square.pos.y += @.speed
                    when 3 then @.square.pos.y -= @.speed
                #@.square.pos.x = ( window.innerWidth / 2 ) + Math.sin( x * ( Math.PI / 180 )) * ( window.innerWidth / 3 )
                #@.square.pos.y = window.innerHeight / 2
                #@.square.scale = 100 + Math.cos( x * ( Math.PI / 180 )) * ( 200 / 3 )
            , 1000 / 60
        