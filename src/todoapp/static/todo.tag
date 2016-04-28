<todo>
    <h1>Hello World</h1>

    <ol>
        <li each={ todos }>
            { text }
        </li>
    </ol>

    <form onsubmit={ add }>
        <input name="input">
        <button>Add</button>
    </form>

    this.disabled = false
    this.items = opts.items

    this.todos = [
        {text: 'Hamoos uma'},
        {text: 'Halo servisu uma'},
    ]

    add(e){
        if( this.input.value ){
            this.todos.push({text: this.input.value})
        }
    }

</todo>
