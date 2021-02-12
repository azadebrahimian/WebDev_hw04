defmodule Practice.Factor do
    # Credit for algorithm: https://www.geeksforgeeks.org/print-all-prime-factors-of-a-given-number/

    def eval(n) do
        n = String.to_integer(n)
        {n, out} = findNumTwos(n, [])
        {n, out} = skipThrough(n, out, 3, :math.sqrt(n)+1)
	if n > 2 do
            out = List.insert_at(out, -1, n)
	    Enum.join(out, " ")
	else
	    Enum.join(out, " ")
	end
    end
 
    def divideByIndex(n, out, i) do
        if rem(n, i) == 0 do
            out = List.insert_at(out, -1, i)
            n = trunc(n / i)
            divideByIndex(n, out, i)
        else
            {n, out}
        end
    end
 
    def skipThrough(n, out, i, final) do
        if i < final do
            {n, out} = divideByIndex(n, out, i)
            skipThrough(n, out, i+2, final)
        else
            {n, out}
        end
    end
 
    def findNumTwos(n, out) do
        if rem(n,2) == 0 do
            out = List.insert_at(out, -1, 2)
            findNumTwos(trunc(n / 2), out)
        else
            {n, out}
        end
    end
end
