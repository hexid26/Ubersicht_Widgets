JsOsaDAS1.001.00bplist00�Vscript_
/of = Application('OmniFocus');

doc = of.defaultDocument;

getFlaggedTasks();

function getFlaggedTasks(){
	taskList = [];
	var now = new Date();
	var today = new Date(now);
	today.setHours(23);
	today.setMinutes(59);
	today.setSeconds(59);
	var tomorrow = new Date(today);
	tomorrow.setDate(today.getDate()+1);
	tasks = doc.flattenedTasks.whose({completed: false, flagged: true, inInbox: false})();
	tasks.forEach(function(task){
		if ((task.dueDate()) && task.dueDate() < tomorrow && task.parentTask()) {
			if (task.deferDate() < now){
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
	tasks.forEach(function(task){
		if ((task.dueDate()) && task.dueDate() < tomorrow && task.parentTask()) {
			if (task.deferDate() < now){
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
		var twodays = new Date(tomorrow);
		twodays.setDate(tomorrow.getDate()+1);
		tasks = doc.flattenedTasks.whose({completed: false, flagged: true, inInbox: false})();
		tasks.forEach(function(task){
			if ((task.dueDate()) && task.dueDate() < tomorrow && task.parentTask()) {
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
			if ((task.dueDate()) && task.dueDate() < tomorrow && task.parentTask()) {
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
}                              
E jscr  ��ޭ