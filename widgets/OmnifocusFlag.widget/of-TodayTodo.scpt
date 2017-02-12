JsOsaDAS1.001.00bplist00�Vscript_	�of = Application('OmniFocus');

doc = of.defaultDocument;

getFlaggedTasks();

function getFlaggedTasks(){
	taskList = [];
	tasks = doc.flattenedTasks.whose({completed: false, flagged: true, inInbox: false})();
	var today = new Date();
	tasks.forEach(function(task){
		if ((task.dueDate()) && task.dueDate() - today < 1000*60*60*24*1 && task.parentTask()) {
			if (task.deferDate() < today){
				context = (task.context() !== null) ? task.context().name() : '';
				project = (task.container() !== null) ? task.container().name() : '';
				taskList.push({
					name: task.name(),
					id: task.id(),
					context: context,
					project: project,
					note: task.note(),	
				});
			}
		}
	});
	tasks = doc.flattenedTasks.whose({completed: false, flagged: false, inInbox: false})();
	var today = new Date();
	tasks.forEach(function(task){
		if ((task.dueDate()) && task.dueDate() - today < 1000*60*60*24*1 && task.parentTask()) {
			if (task.deferDate() < today){
				context = (task.context() !== null) ? task.context().name() : '';
				project = (task.container() !== null) ? task.container().name() : '';
				taskList.push({
					name: task.name(),
					id: task.id(),
					context: context,
					project: project,
					note: task.note(),	
				});
			}
		}
	});
	
	if(taskList.length == 0){
		tasks = doc.flattenedTasks.whose({completed: false, flagged: true, inInbox: false})();
		tasks.forEach(function(task){
			if ((task.dueDate()) && task.dueDate() - today < 1000*60*60*24*2 && task.parentTask()) {
				context = (task.context() !== null) ? task.context().name() : '';
				project = (task.container() !== null) ? task.container().name() : '';
				taskList.push({
					name: task.name(),
					id: task.id(),
					context: context,
					project: project,
					note: task.note(),
				
				});
			}
		});
		tasks = doc.flattenedTasks.whose({completed: false, flagged: false, inInbox: false})();
		var today = new Date();
		tasks.forEach(function(task){
			if ((task.dueDate()) && task.dueDate() - today < 1000*60*60*24*2 && task.parentTask()) {
				context = (task.context() !== null) ? task.context().name() : '';
				project = (task.container() !== null) ? task.container().name() : '';
				taskList.push({
					name: task.name(),
					id: task.id(),
					context: context,
					project: project,
					note: task.note(),
				
				});
			}
		});
	}
	
	retObj = {
		'tasks' : taskList,
		'count' : taskList.length
	};

	return JSON.stringify(retObj);
}                              	� jscr  ��ޭ