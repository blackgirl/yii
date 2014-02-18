define ['knockout'] , (ko) ->
	projectId = 0;
	viewModel =
		cache: null
		editable: 
			Id : ko.observable(0)
			Name : ko.observable('')
			ProjectId: ko.observable(projectId)
			Status: ko.observable(0)
		tasks : ko.observableArray()
		remove: (task) ->
			$.ajax
				url: 'index.php/task/delete/'+ task.Id
				type: 'post'
				success: (result) ->
					if !result then return
					viewModel.tasks.remove task
					return
			return 
		add: () ->
			if !viewModel.editable.Id() and !viewModel.editable.Name()  then return
			viewModel.tasks.remove viewModel.cache 
			task =  
			  Id: viewModel.editable.Id() 
			  Name: viewModel.editable.Name() 
			  ProjectId: projectId
			  Status: viewModel.editable.Status()
			$.ajax 
				url: if viewModel.cache? then 'index.php/task/update/' + task.Id else 'index.php/task/create' 
				type: 'post'
				data:
					Task: task
				success: (result) ->
					if !result then return
					viewModel.tasks.push task	
					return
			$('#name').val('').focus()
			viewModel.editable.Name null
			viewModel.editable.Id null

			viewModel.cache = null 
			return
		edit: (task) ->
			viewModel.cache = task
			viewModel.editable.Id task.Id
			viewModel.editable.Name task.Name
			viewModel.editable.Status task.Status
			return
		activate: (id) ->
			projectId = id;
			$.ajax
				url: 'index.php/task/index/'+id
				type:'get'
				mimeType: "application/json"
				dataType: "json"
				success: (data)-> 
					viewModel.tasks data
					return		
			return
	return viewModel
