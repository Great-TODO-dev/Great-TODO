class MainStore {
  MainStore();

  // TODO: сделать тип данных отвечающий за таски
  dynamic updateTasks(){
    var tasks = [
      {
        'name' : 'Kill all bastards',
        'completed' : true
      },
      {
        'name' : 'Kill all god damn fools',
        'completed' : false
      },
      {
        'name' : 'Find a gun',
        'completed' : false
      }
    ];
    return tasks;
  }
}
