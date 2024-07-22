hp = clamp(hp, 0, hpMax);
hpLast = hp;

if (hp == 0) && (state.name != "Execute")
{
	switch_state(stateExecute);
}