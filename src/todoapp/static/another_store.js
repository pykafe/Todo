function AnotherStore() {

    var self = this;

    riot.observable(self)

    console.log(' Another store created');


    self.on('todos_please', function(){
        console.log('todos_please has been heard by another store');
    });
}
