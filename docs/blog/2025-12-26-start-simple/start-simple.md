# Start Simple
## A forgotten lesson for the AI native developers

I work a lot with AI models and tools and I have also developed a few of them. I use them for coding, writing and generally recommend that 
professionals are comfortable with these tools even if they choose not to use them. I, however, have started to see developers[^1] - especially, but not only, young developers -
who miss hard earned lessons because AI development tools doesn't have the same _affordances_ as traiditional programming. 
The lesson I am referring to here is starting simple - building up a simple minimal solution and then adding only the required complexity incrementally.

<!-- so why should you listen to me -->
[^1]: I come across developers and researchers mainly though open-source work, for instance as one of the core maintainers of [`mteb`](https://github.com/embeddings-benchmark/mteb) a package for evaluating embedding models and retrieval systems. However, I also frequently tutor a young open-source souls through the [Danish Data Science Community](https://ddsc.io/) and also engage with researcher and developers through might day job as a post-doc at Aarhus University.

!!! question "what is an affordance?"

    Affordance is a design concept referring to the possible actions that are readily available (afforded) to the user.

I the following segments I will briefly introduce the pattern and why it is useful and then I will introduce why current language models does not
prefer simple solutions. Lastly I will talk about how I could see future models address this limitaitons both as a user and as AI developers. 

## Starting simple used to be default

While starting simple is by no mean a new concept, terms like _"keep it simple stupid"_ (KISS), _"minimal viable product"_ (MVP), _lean_ all preach 
simplicity, but these often focus on simplicity as the goal and while this is important, I want to focus more on simplicity as a starting point for 
building good design and thus more related concepts might be _emergent design_ or patterns such as _walking skeleton_ or _the strangler fig pattern_.

Starting simple, is quite a seeemingly natural way to solve a (coding) problem, I suspect if you look over your recent solutions
they start simple and then complexity is added incrementally[^3].

[^3]: Although seemingly natural, there are plenty of design patterns that seeks to get you to start and keep it simple such as test-driven development

This comes natural from the simple limitations that **you** have to produce it and you are limited in how much you can produce. 
Starting simple allows you to focus on the core component that solves the main problem and then iteratively adds complexity to solve edge cases such as 
network error handling or satisfying the type checker.
This patterns might seems trivial, but language models have changed the recipe, they allow you to go directly to a fully fledged solutions allowing you 
to produce tons of code within a second[^4].

[^4]: Such solutions can are perfectly fine e.g. for one-off apps where functionality can be easily validated.


## Language models are not punished by complexity

Large language models for coding and programming has recently gotten _very_ good and one of the reason is that they are in the same group as mathematics, which 
have also recently seen dramatic rise in performance due to training regime *"reinforcement learning from verifiable reward"* (RLVR), in which a solution can be validated to be **correct** -  
We can check (by running the code), that it gives us the right results, is correcty formatted and free of syntax errors. This makes it possible to train models to
implement diverse algorithms and solve a wide range of programming tasks.

The problem is that RLVR only rewards a solution, anything that fails even if trivial fails is zero points on the scoreboard. So it incentivized to
code with plenty of try except clauses to try to get a few extra points in the edge cases. Even adding potential checks to ensure that the correct
solution it produced correctly.

And while I am sure that multiple labs have tuned the reinforcement learning pipeline, by penalizing code with large runtime, high complexity and low readability it doesn't solve the underlying problem. That you are optimizing for a solution, while what you really want is to optimize for the process[^5].

[^5]: I do think that optimizing for solutions gives us a lot of value, climbing an easy but wrong hill can often allow you to get to a better spot to tackle the next hill. Pre-training is a good example of this. 

Why is that? Well as most developers that have know you often discover an edge case as you develop that makes you rethink the solution - maybe we should solve it differently.
Implementing the solution is as much about discovering and learning what the best solution is rather than simply implementing it. 
Current reinforement learning approached does not state, work halfway through the problema and decide, maybe I should try to solve it in a completely different way because this approach
was way more complex than I thought. However you can however query this after the models have made a solution, but I generally find that the model has a fairly poor nose for quality especially if the task if outside common coding practices[^6].

[^6] Andrej Karpathys [descriped](https://analyticsindiamag.com/ai-news-updates/andrej-karpathy-says-nanochat-is-entirely-hand-written-not-vibe-coded/) a similar experience when developing nanochat GitHub for developer a chatbot using less that 100$ from scatch. 


<!-- 
from conversation with Sara:

The reason why it will RL will fails is that correct code is contextual. Depending on the use-case one might want it simpler, more fault tolerant 
and

coding often involves trade-offs and a part of coding is choosing between robustness, maintainability, etc.

 -->