<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            { text }
            <button onclick={ delete }>X</button>
        </li>
    </ol>

    <form onsubmit={ add }>
        Text: <input name="input">
        Done <input type="checkbox" id="checkbox" />
        <button>Add</button>
    </form>

    var self = this
    self.todos = []

    this.on('mount', function(){
        // get our todos
        $.get('/api/todos/', function(data){
            self.todos = data.results            
            self.update()
        })

    })

    add(e){
       // check if we have a todo to post
        if( self.input.value )
        {
            var new_todo = { text: self.input.value }
            // post the new todo to the api
            $.post('/api/todos/', new_todo, function(data){
                console.log(data)
                // we add the todo to the todo array
                self.todos.push(data)
                // we update the display of the tag
                self.update()
                self.input.value = ''
            })
        }
    }
    
    delete(e){
            // delete the todo
            $.ajax(e.item.url, {
                method: 'DELETE',
                success: function(data){
                    alert('deleted')
                    // delete the todo fromt he local array
                var position_of_item = self.todos.indexOf(e.item)
                self.todos.splice(position_of_item, 1)
                self.update()
                }
            })
        }
</todo>
