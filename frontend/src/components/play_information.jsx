// this is all the data about the play selected in the plays_window
// this also should match the picture in play_preview

export default function Play_Information(props) {
    return (
        <div>
            <div>Play Information Of Selected Play From Window</div>
            <div>Image of Selected Play from Plays Window</div>
            <div>Offense: {props.gameState[0]}</div>
            <div>Defense: {props.gameState[1]}</div>
            <div>Current Quarter: {props.gameState[4]}</div>
            <div>Game Clock: {props.gameState[5] / 60}</div>
        </div>
    );
}