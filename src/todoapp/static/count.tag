<count>
    <h1>count</h1>
    <div> { count } </div>

    var self = this

    self.on('mount', function(){
        console.log('todos tag mounted, todos_please triggered')
        RiotControl.trigger('todos_please')
    })

    RiotControl.on('todos_available', function(todos){
        console.log('todos_available heard by another tag')
        console.log(todos)
        self.count = todos.length
        self.update()
    })
</count>
