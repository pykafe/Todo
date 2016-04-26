<todo>
    <h1>Hello World</h1>

    <h5>Hello World</h5>
    <ol>
        <li each={ todos }>
            { text }
        </li>
    </ol>
    <form onsubmit={ add }>
        <input name="input" onkeyup={ text }>
        <button disabled={ !text }>Add { items.filter(whatShow).length + 1 }</button>
        <button disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>
        X{ items.filter(onlyDone).length } </button>
    </form>
         <script>
            this.disabled = false
            this.items = opts.items
         </script>
    this.todos = [
        {text: 'Hamoos uma'},
        {text: 'Halo servisu uma'},
    ]

</todo>
