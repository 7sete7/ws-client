import React, { useState } from 'react'

export default ({ onSend }) -> 
    [text, setText] = useState ''

    return (
        <div className="input">
            <textarea value={text} onChange={(e) -> setText e.target.value}></textarea>
            <button onClick={(e) -> onSend(text)(e); setText '' } className="send-button">
                <span>Send</span>
            </button>
        </div>
    )
    