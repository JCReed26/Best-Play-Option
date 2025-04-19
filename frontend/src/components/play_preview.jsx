// this is where the image of the play with the arrows is displayed 

export default function Play_Preview(props) {
    return (
        <div>
            <div>Image of Selected Play from Plays Window</div>
            <div>Offense: {props.gameState[0]}</div>
            <div>Defense: {props.gameState[1]}</div>
            <div>Current Quarter: {props.gameState[4]}</div>
            <div>Game Clock: {props.gameState[5] / 60}</div>
            <div>QUESTION: where we getting the play pictures</div>
        </div>
    );
}