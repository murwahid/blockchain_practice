//LICENSE
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {

    //creating a structure 
    struct Voter {
        uint weight; 
        bool voted; //bool since this is a simple yes or no. 
        address delegate; 
        uint vote; 
    }

    struct Proposal {
        bytes32 name;
        uint voteCount; //number of total votes
    }

    address public chairperson; 

    mapping(address => Voter) public voters;

    //declare an array for proposals 
    Proposal[] public proposals;

    //CONSTRUCTOR FUNCTION FOR PROPOSALS
    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1; 
        for(uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i], 
                voteCount:0
            }));
        }
    }

    //CREATING THE RIGHT TO VOTE
    function giveRightToVote(address voter) external {
        require(
            msg.sender == chairperson, 
            "Only chairperson can give right to vote."
        ); 

        require(
            !voters[voter].voted, 
            "The voter already voted."
        );

        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    //DELEGATING YOUR VOTE TO SOMEONE ELSE
    function delegate(address to) external {
        Voter storage sender = voters[msg.sender];

        require(sender.weight !=0, "You have no right to vote");
        require(!sender.voted, "You already voted.");

        require(to != msg.sender, "Self-delegation is disallowed.");

        while(voters[to].delegate !=address(0)) { //==> WHAT IS ADDRESS 0?
            to = voters[to].delegate;
            require(to != msg.sender, "Found loop in delegation.");
        }

        Voter storage delegate_ = voters[to];

        require(delegate_.weight >= 1);
        sender.voted = true; 
        sender.delegate = to;
        if (delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }
    }
    //ability to vote
    function vote(uint proposal) external {
            Voter storage sender = voters[msg.sender];
            require(sender.weight !=0, "Has no right to vote."); 
            require(!sender.voted, "Already voted."); 
            sender.voted = true;
            sender.vote = proposal; 

            //error handling 
            proposals[proposal].voteCount += sender.weight;
        }
    //counting all the votes to determine the winning proposal
    function winningProposal() public view
            returns (uint winningProposal_)
            {
                uint winningVoteCount = 0; 
                for(uint p=0; p < proposals.length; p++) {
                    winningVoteCount = proposals[p].voteCount;
                    winningProposal_ = p;
                }
            }
        
    //returning ballot winner
    function winnerName() external view 
            returns (bytes32 winnerName_) {
                winnerName_=proposals[winningProposal()].name;
            }

}