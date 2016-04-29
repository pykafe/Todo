<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            { text } <button onclick={ delete }>X</button>
            <button onclick={ edit }>edit</button>
        </li>
    </ol>

    <form onsubmit={ add }>
        <input name="input" onkeyup={ edit_up }>
        <button disabled={ !text }>Add</button>
    </form>

    var self = this
    self.disabled = false
    self.items = opts.items

    self.todos = [] 

    self.on('mount', function(){
        $.get('/api/todos/', function(data){
            self.todos = data.results
            self.update()
        })
    })

     edit_up(e) {
        self.text = e.target.value
        }


    add(e){
        if( self.input.value ){
            var todo = {text: self.input.value}
            $.post('/api/todos/', todo, function(data){
                self.todos.push(data)
                console.log(self.todos)
                self.input.value = ''
                self.update()
            })
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

    edit(e){
        $.ajax(e.item.url, {
            method: 'GET',
            success: function(data){
            console.log(e.item.text)
                // edit the todo from the todo list
                self.input.value = data.text = e.item.text
                self.update()
            }
        })
    }

</todo>
