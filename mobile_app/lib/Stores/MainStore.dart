class MainStore {
  MainStore();

  // TODO: сделать тип данных отвечающий за таски
  dynamic updateTasks(){
    var tasks = [
      {
        'name' : 'Kill all bastards',
        'completed' : true,
        'description' : 'finally'
      },
      {
        'name' : 'Kill all god damn fools',
        'completed' : false,
        'description' : 'of course i hate them'
      },
      {
        'name' : 'Find a gun',
        'completed' : false
      }
    ];
    return tasks;
  }
}
