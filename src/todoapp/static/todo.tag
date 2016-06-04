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

    RiotControl.on('todo_added', function(new_todo){
        console.log('todo_added heard by tag')
        console.log(new_todo)
        self.todos.push(new_todo)
        self.update()
    })

    add(e){
        if( self.input.value ){
            console.log('add button clicked, add_todo triggered')
            RiotControl.trigger('add_todo', self.input.value)
        }
    }

    delete(e){
        $.ajax(e.item.url, {
            method: 'DELETE',
            success: function(data){ 
                // remove the todo from the todo list
                var position_of_item = self.todos.indexOf(e.item)
                self.todos.splice(position_of_item, 1)
                self.update()
            }
        })
    }

</todo>
