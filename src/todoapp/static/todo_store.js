function TodoStore() {

    var self = this;

    riot.observable(self)

    console.log(' Todo store created');


    self.on('todos_please', function(){
        console.log('todos_please has been heard by todo store');
        $.get('/api/todos/', function(data){
            console.log('todos have been retrieved - triggerring todos_available');
            console.log(data);
            self.trigger('todos_available', data.results)
        })
    });

    self.on('add_todo', function(todo_text){
        console.log('add_todo has been heard by todo store');
        console.log(todo_text);
        var todo = {text: todo_text}
        $.post('/api/todos/', todo, function(new_todo){
            console.log('todo has been created');
            console.log(new_todo);
            self.trigger('todo_added', new_todo)
        })
    })

    self.on('delete_todo', function(todo){
        console.log('delete_todo has been heard by todo store');
        console.log(todo);
        $.ajax(todo.url, {
            method: 'DELETE',
            success: function(){ 
                console.log('todo has been deleted');
                self.trigger('todo_deleted', todo)
            }
        })
    })

}
