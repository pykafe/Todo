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
}
