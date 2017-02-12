command: "NetStat.widget/scripts/netst"

refreshFrequency: 6000

style: """
  bottom: 155px
  left: 225px
  font-family: Helvetica Neue

  div
    display: block
    font-size: 20px
      
  p
    margin: 0
    font-weight: normal
    font-size: 20px
    color: #ffffff   

  p > span
    font-weight: normal
    color: rgba(#faf0e6, .55)   

"""


render: -> """
  <div class='netstat'>
  	<p>In: <span id="in"></span></p>
  	<p>Out: <span id="out"></span></p>
  </div>
"""


update: (output, domEl) ->
  bytesToSize = (bytes) ->
    return "0 Byte"  if bytes is 0
    k = 1024
    sizes = [
      "b/s"
      "kb/s"
      "mb/s"
      "gb/s"
      "gb/s"
      "pb/s"
      "eb/s"
      "zb/s"
      "yb/s"
    ]
    i = Math.floor(Math.log(bytes) / Math.log(k))
    (bytes / Math.pow(k, i)).toPrecision(3) + " " + sizes[i]
  values = output.split(' ')
  $(domEl).find('#in').text(bytesToSize(values[0]))
  $(domEl).find('#out').text(bytesToSize(values[1]))


