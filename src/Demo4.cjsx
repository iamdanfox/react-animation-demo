
React = require 'react'
require './Demo4.less'



# Bullet is fired horizontally at 1 pixel per second
class Bullet
  hvel: 10
  vvel: 5

  constructor: ({@x, @y}) ->

  getPosition: (time) =>
    x: @hvel * time + @x
    y: @vvel*time + 0.5*(-0.09)*time*time + @y







module.exports = React.createClass
  displayName: 'Demo4'

  getInitialState: ->
    cutOff: 9999

  hover: (e) ->
    @setState
      cutOff: e.pageX - @refs.r.getDOMNode().getBoundingClientRect().left

  render: ->
    myBullet = new Bullet
      x: 0
      y: 20

    positions = for t in [0..100]
      myBullet.getPosition t

    <div className='demo4' style={{height: 200}} onMouseMove={@hover} ref={'r'}>
      <h1>Demo4</h1>
      { positions
          .filter (pos) => pos.x < @state.cutOff
          .map (pos) -> <Dot pos={pos} /> }
    </div>



Dot = React.createClass
  render: ->
    <div className='dot' style={{left: @props.pos.x, bottom: @props.pos.y}}></div>
