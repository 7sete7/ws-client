import React, { useState } from 'react'

export default ({ onSend }) -> 
    state = useState ''
    text = state[0]
    setText = state[1]

    return (
        <div className="input">
            <textarea onChange={(e) -> setText e.target.value}></textarea>
            <button onClick={(e) -> onSend(text)(e); setText '' } className="send-button">
                <span>Send</span>
            </button>
        </div>
    )
    