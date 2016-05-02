<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            <div>
                { text }
                <button onclick={ delete }>X</button>
                <button onclick={ edit }>edit</button>
            </div>
        </li>
    </ol>
    <div if={ editing_item }>
        <input name="edit_input"  >
        <button onclick={ save_edit }>save</button>
        <button onclick={ stop_edit }>back</button>
    </div>

    <form onsubmit={ add }>
        <input name="input" onkeyup={ edit_up }>
        <button disabled={ !text }>Add</button>
    </form>

    var self = this
    self.disabled = false
    self.items = opts.items
    self.editing_item = false
    console.log(self)

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
        self.editing_item = e.item
        self.edit_input.value = e.item.text
    }

    stop_edit(e){
        self.editing_item = false
    }

    save_edit(e){
        console.log(self)
        self.editing_item.text = self.edit_input.value
        $.ajax(self.editing_item.url, {
            method: 'PUT',
            data: self.editing_item,
            success: function(data){ 
                self.editing_item = false
                self.update()
            }
        })
    }

</todo>
