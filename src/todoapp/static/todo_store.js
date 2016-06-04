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
        $.post('/api/todos/', todo, function(data){
            console.log('todo has been created');
            console.log(data);
            self.trigger('todo_added', data)
        })
    })
}
