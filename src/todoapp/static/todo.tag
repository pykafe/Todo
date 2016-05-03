<todo>
    <h1> ToDo </h1>
    <ol>
        <li each = { tasks }> { task } </li>
    </ol>

    <input type="text" id="taskinput"/>
    <button onclick={ add }> Add </button>

    <script>
    this.tasks = [{'task': 'Tugas'}, {'task': 'Push commit'}]

    add(e){
        new_task = {'task': taskinput.value}
        this.tasks.push(new_task)
    }
    </script>
</todo>
