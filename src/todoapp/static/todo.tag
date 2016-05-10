<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            { text }
            <button onclick={ delete }>X</button>
            <button onclick={ edit }>Edit</button>
        </li>
    </ol>

    <form onsubmit={ add }>
        <input name="input">
        <button>Add</button>
    </form>

    <div if={ editing_item }>
        <input name="edit_input">
        <button onclick={ edit_save }>Edit</button>
        <button onclick={ stop_edit } >Stop</button>
    </div>

    <script>
        //this.disabled = false
        //this.items = opts.items

        //this.todos = [
            //{text: 'Hamoos uma'},
            //{text: 'Halo servisu uma'},
        //]

        //add(e){
            //if( this.input.value ){
                //this.todos.push({text: this.input.value})
            //}
        //}


        var self = this
        self.adding_item = true
        self.todos = []

        this.on('mount', function(){
            // get our todos
            $.get('/api/todos/', function(data){
                console.log(self)
                self.todos = data.results
                self.update()
            })
        })

        add(e){
            // check if we have a todo to post
            if( self.input.value ){
                var new_todo = { text: self.input.value }
                // post the new todo to the api
                $.post('/api/todos/', new_todo, function(data){
                    console.log(data)
                    // we add the todo to the todo array
                    self.todos.push(data)
                    // we update the display of the tag
                    self.update()
                })
                self.input.value = ""
            }
        }

        delete(e){
            // delete the todo
            $.ajax(e.item.url, {
                method: 'DELETE',
                success: function(data){
                    // delete the todo from the local array
                    var items_position = self.todos.indexOf(e.item)
                    self.todos.splice(items_position, 1)
                    self.update()
                }
            })
        }

        edit(e){
            self.adding_item = false
            self.editing_item = e.item
            self.edit_input.value = e.item.name
        }

        stop_edit(e){
            self.adding_item = false
            self.adding_item = true
        }

        edit_save(e){
            self.editing_item.name = self.edit_input.value
            $.ajax(self.editing_item.url, {
                method: 'PUT',
                data: self.editing_item,
                success: function(data){
                    self.editing_item = false
                    self.adding_item = true
                    self.update()
                }
            })
        }
    </script>
</todo>
