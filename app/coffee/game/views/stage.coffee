define ->
    
    class StageView
        
        shapes: []
        
        init: ->
            @.getElements()
            @.loop()
            
        getElements: ->
            @.canvas = document.getElementsByTagName( "canvas" )[ 0 ]
            @.stage = @.canvas.getContext("2d")
        
        render: ( el ) =>
            @.shapes.push( el )
        
        loop: =>
            @.update()
            @.clear()
            @.draw()
            
            requestAnimationFrame( @.loop )
        
        update: ->
            if @.width isnt window.innerWidth or @.height isnt window.innerHeight
                @.width = window.innerWidth
                @.height = window.innerHeight
                @.canvas.height = @.height
                @.canvas.width = @.width
                
        clear: ->
            @.stage.clearRect( 0 , 0 , @.width , @.height )
            
        draw: =>
            c = @.stage
            i = 0
            
            while i < @.shapes.length
                
                s = @.shapes[ i ]
                p = s.points
                m = s.scale
                
                c.save()
                c.fillStyle = s.color
                c.translate( s.pos.x , s.pos.y )
                c.rotate( s.pos.r * ( Math.PI / 180 ))
                c.beginPath()
                
                n = 0
                while n < p.length
                    x = ( p[n].x - 0.5 ) * m
                    y = ( p[n].y - 0.5 ) * m
                    
                    if n is 0
                        c.moveTo( x , y )
                    else
                        c.lineTo( x , y )
                    n++
                    
                c.fill()
                c.restore()
                    
                i++