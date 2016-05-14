<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            <div>
                { text }
                <input type="checkbox" checked={ done }/>
                <button onclick={ delete }>X</button>
                <button onclick={ edit }>edit</button>
            </div>
        </li>
    </ol>
    <div if={ editing_item }>
        <input name="edit_input"  >
        <input type="checkbox" name="edit_checkbox">
        <button onclick={ save_edit }>save</button>
        <button onclick={ stop_edit }>back</button>
    </div>

    <form onsubmit={ add }>
        <input name="input" onkeyup={ edit_up }>
        <input type="checkbox" id="checkbox">
        <button disabled={ !text }>Add</button>
    </form>

    var self = this
    self.disabled = false
    self.items = opts.items
    self.editing_item = false
    console.log(self)

    self.todos = [] 
    self.todos = opts.todos 

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
            var todo = {text: self.input.value, done: checkbox.checked}
            $.post('/api/todos/', todo, function(data){
                var sock = socket.send(data['text'])
                self.todos.push(sock)
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
        self.edit_checkbox.checked = e.item.done
    }

    stop_edit(e){
        self.editing_item = false
    }

    save_edit(e){
        console.log(self)
        self.editing_item.text = self.edit_input.value
        self.editing_item.done = self.edit_checkbox.checked
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
