# Set the refresh frequency (milliseconds).
refreshFrequency: 1000 * 60 * 10

style: """
  bottom: 240px
  left: 10px
  color: #fff
  background: rgba(0,0,0,0.4)
  font-family: Helvetica Neue
  font-size: 14px
  font-weight: 500
  width: 300px
  max-width: 450px
  border: 2px solid #b00
  -webkit-backdrop-filter: blur(2px)

  .list
      padding: 0px 0px 0px 10px

  .tasks
      margin: 0px 0px 0px 0px
      padding: 0px 0px 0px 0px


  .task
      margin: 0px 0px 0px 0px
      padding: 0px 5px 7px 20px
      white-space: nowrap
      overflow: hidden
      text-overflow: ellipsis
      position: relative
      line-height: 1.1
      opacity: 1

  .task-note, .task-project, .task-context
      position: relative
      overflow: hidden
      text-overflow: ellipsis
      padding: 0px 0px 0px 0px
      line-height: 1
      font-size: 12px
      color: rgba(128,128,128,1)

  .task-project, .task-context
        font-weight: bold
        color: rgba(212,125,125, 0.9)

    .task::after
      content: ""
      position: absolute
      width: 10px
      height: 10px
      background: rgba(0,0,0,0.2)
      -webkit-border-radius: 20px
      border-style: solid
      border-color: rgba(255,165,0,1)
      left: 0px
      top: 0px

    .count
       font-size: 16px
       font-weight: bold
       text-align: center
       padding: 7px 0px 9px 0px
       background: rgba(155,55,50,0.7)
       width: auto
       border-top-style: solid
       border-top: thick solid #f00;

    .of-empty
        width: auto
        color: #fff
        text-align: center
        margin-top: 0

  a, a:link, a:visited
      color: #fff
      text-decoration: none
"""

render: (_) -> """
    <div class='count'></div>
    <div id='todos'></div>
"""

command: "osascript './OmnifocusFlag.widget/of-TodayTodo.scpt'"

update: (output, domEl) ->
    if output
        @ofObj = JSON.parse(output)
        @_render();
        $(domEl).find('#todos').html(@taskList)
        $(domEl).find('.count').html(@count)

_render: () ->
    @count = "Today Todo: " + @ofObj.count + " Avialable";
    @taskList = '<ul class="list">'
    if @ofObj.tasks.length
        @ofObj.tasks.forEach (task) =>
            @taskList +=  '<li class="task">' +
                        '<a href="omnifocus:///task/' + task.id + '">' + task.name + '</a>' +
                        '<div>' + @_project(task) + @_context(task) + '</div>' +
                        @_note(task) +
                       '</li>'
        @taskList += '</ul>'
    else
        @taskList = '<h4 class="of-empty">No Flagged Tasks</h4>'

_project: (task) =>
    return if (task.project and task.project != 'OmniFocus') then '<span class="task-project">' + task.project + '</span>' else ''

_context: (task) =>
    return if task.context then '<span class="task-context"> @ ' + task.context + '</span>' else ''

_note: (task) =>
    return if task.note then '<div class="task-note">' + String(task.note) + '</div>' else ''

