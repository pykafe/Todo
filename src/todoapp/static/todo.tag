<todo>
    <h1>Hello World</h1>

    <ul>
        <li each={ todos }>
            { text } <button onclick={ delete }>X</button>
        </li>
    </ul>

    <form onsubmit={ add }>
        <input name="input">
        <button>Add</button>
    </form>

    var self = this

    self.todos = [] 

    self.on('mount', function(){
        console.log('todos tag mounted, todos_please triggered')
        RiotControl.trigger('todos_please')
    })

    RiotControl.on('todos_available', function(todos){
        console.log('todos_available heard by tag')
        console.log(todos)
        self.todos = todos
        self.update()
    })

    add(e){
        if( self.input.value ){
            
            var new_todo = {text: self.input.value}
            self.todos.push(new_todo)

            console.log('add button clicked, add_todo triggered')
            RiotControl.trigger('add_todo', new_todo)
        }
    }

    delete(e){
        var position_in_array = self.todos.indexOf(e.item)
        self.todos.splice(position_in_array, 1)

        console.log('delete button clicked, delete_todo triggered')
        RiotControl.trigger('delete_todo', e.item)
    }

</todo>
