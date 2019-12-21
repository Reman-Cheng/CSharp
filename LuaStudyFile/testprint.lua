function print1()
	io.write("     *  *     \n")
	io.write("  *  *  *     \n")
	io.write("  *  *  *     \n")
	io.write("     *  *     \n")
	io.write("     *  *     \n")
	io.write("     *  *     \n")
	io.write("     *  *     \n")
	io.write("     *  *     \n")
	io.write("* *  *  *  * *\n")
	io.write("* *  *  *  * *\n")
end


function print2()
	io.write("  * * * *  *  \n")
	io.write(" * *  * * * * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("         *  * \n")
	io.write("       *  *   \n")
	io.write("     *  *     \n")
	io.write("  *  *        \n")
	io.write("* * * * * * **\n")
	io.write("* * * * * * **\n")
end
-- print2()



function print3()
	io.write("    * ** *    \n")
	io.write("  * * ** * *  \n")
	io.write("* *       *  *\n")
	io.write("         * *  \n")
	io.write("    *  *  *   \n")
	io.write("    *  *  *   \n")
	io.write("         * *  \n")
	io.write("* *       *  *\n")
	io.write("  * * ** * *  \n")
	io.write("    * ** *    \n")
end
-- print3()

function print4()
	io.write("        * *   \n")
	io.write("      * * *   \n")
	io.write("　   ** * *   \n")
	io.write("   * *  * *   \n")
	io.write("  * *   * *   \n")
	io.write(" * *    * *   \n")
	io.write("* * * * * ** *\n")
	io.write("* * * * * ** *\n")
	io.write("        * *   \n")
	io.write("        * *   \n")	
end

function print5()
	io.write("* * * * * * **\n")
	io.write("*   * * * * **\n")
	io.write("* *  *        \n")
	io.write("    *   *     \n")
	io.write("       *  *   \n")
	io.write("         *  * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write(" * *  * * * * \n")
	io.write("  * * * *  *  \n")	
end
-- print5()
function print6()
	io.write("        *  *  \n")
	io.write("       *  *   \n")
	io.write("　    *  *    \n")
	io.write("    *  *      \n")
	io.write("  *  *   * *  \n")
	io.write(" *  *    *  * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write(" * *  * * * * \n")
	io.write("  * * * *  *  \n")	
end
-- print6()
function print7()
	io.write("* * * * * * **\n")
	io.write("* * * * * * **\n")
	io.write("* *      *  * \n")
	io.write("       *  *   \n")
	io.write("    *  *      \n")
	io.write("    *  *      \n")
	io.write("    *  *      \n")
	io.write("    *  *      \n")
	io.write("    *  *      \n")
	io.write("    ****      \n")	
end
-- print7()
function print8()
	io.write("    * ** *    \n")
	io.write(" *  *    *  * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("   *  **  *   \n")
	io.write("   *  **  *  \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write(" *  *    *  * \n")
	io.write("    * ** *    \n")	
end
function print9()
	io.write("  * * * *  *  \n")
	io.write(" * *  * * * * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write(" *  *    *  * \n")
	io.write("  *  *   * *  \n")
	io.write("       * *    \n")
	io.write("     *  *     \n")
	io.write("　 *  *       \n")
	io.write("*  *          \n")	
end
function print0()
	io.write("    * ** *    \n")
	io.write(" *  *    *  * \n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write("* *        * *\n")
	io.write(" *  *    *  * \n")
	io.write("    * ** *    \n")	
end


function zheng(n)
if(n%2==0)then
	io.write(string.rep("  ",n/2).."*"..string.rep(" *",n).."\n")
	for i=1,n/2-1 do
		io.write(string.rep("  ",n/2-i).."*"..string.rep("  ",n-1).." *"..string.rep(" ",2*i-1).."*\n")
	end
	io.write("*"..string.rep(" *",n)..string.rep(" ",n-1).."*\n")
	for j=1,n/2 do
		io.write("*"..string.rep("  ",n-1).." *"..string.rep("  ",n/2-1).." *\n")
	end
	for k=1,n/2-1 do
		io.write("*"..string.rep("  ",n-1).." *"..string.rep("  ",n/2-1-k).." *\n")
	end
	io.write("*"..string.rep(" *",n).."\n")
else
	io.write(string.rep(" ",n).."*"..string.rep(" *",n).."\n")
	for i=1,(n-1)/2 do
		io.write(string.rep(" ",n-2*i).."*"..string.rep("  ",n-1).." *"..string.rep(" ",2*i-1).."*\n")
	end
	io.write("*"..string.rep(" *",n)..string.rep(" ",n-1).."*\n")
	for j=1,(n-1)/2 do
		io.write("*"..string.rep("  ",n-1).." *"..string.rep("  ",(n-1)/2).."*\n")
	end
	for k=1,(n-1)/2 do
		io.write("*"..string.rep("  ",n-1).." *"..string.rep(" ",n-2*k).."*\n")
	end
	io.write("*"..string.rep(" *",n).."\n")
end
end
-- zheng(10)

function numEnter(num)
	if num=="1" then
		print1()
	elseif num=="2" then
		print2()
	elseif num=="3" then
		print3()
    elseif num=="4" then
		print4()
	elseif num=="5" then
		print5()
	elseif num=="6" then
		print6()
	elseif num=="7" then
		print7()
	elseif num=="8" then
		print8()
	elseif num=="9" then
		print9()
	else 
		print0()
	end
end
function numChoice(number)
	for num in string.gmatch(string.format("%s",number),"%d")do
		io.write(numEnter(num))

	end
end
-- print("\n")
-- numChoice(132198564)




function numEnter2(num,count,i)
	if num=="1" then
      if i==0 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==1 then
	io.write(string.rep(" ",count).."  *  *  *     ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."  *  *  *     ")
	 elseif i==3 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==7 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==8 then
	io.write(string.rep(" ",count).."* *  *  *  * *")
	 elseif i==9 then
	io.write(string.rep(" ",count).."* *  *  *  * *")
     end

	elseif num=="2" then
      if i==0 then
	io.write(string.rep(" ",count).."  * * * *  *  ")
	 elseif i==1 then
	io.write(string.rep(" ",count).." * *  * * * * ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==3 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==4 then
	io.write(string.rep(" ",count).."         *  * ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."       *  *   ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==7 then
	io.write(string.rep(" ",count).."  *  *        ")
	 elseif i==8 then
	io.write(string.rep(" ",count).."* * * * * * **")
	 elseif i==9 then
	io.write(string.rep(" ",count).."* * * * * * **")
     end

	elseif num=="3" then
     if i==0 then
	io.write(string.rep(" ",count).."    * ** *    ")
	 elseif i==1 then
	io.write(string.rep(" ",count).."  * * ** * *  ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *       *  *")
	 elseif i==3 then
	io.write(string.rep(" ",count).."         * *  ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."    *  *  *   ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."    *  *  *   ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."         * *  ")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* *       *  *")
	 elseif i==8 then
	io.write(string.rep(" ",count).."  * * ** * *  ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."    * ** *    ")
     end

    elseif num=="4" then
		if i==0 then
	io.write(string.rep(" ",count).."        * *   ")
	 elseif i==1 then
	io.write(string.rep(" ",count).."      * * *   ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."　   ** * *   ")
	 elseif i==3 then
	io.write(string.rep(" ",count).."   * *  * *   ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."  * *   * *   ")
	 elseif i==5 then
	io.write(string.rep(" ",count).." * *    * *   ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."* * * * * ** *")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* * * * * ** *")
	 elseif i==8 then
	io.write(string.rep(" ",count).."        * *   ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."        * *   ")
     end

	elseif num=="5" then
		if i==0 then
	io.write(string.rep(" ",count).."* * * * * * **")
	 elseif i==1 then
	io.write(string.rep(" ",count).."*   * * * * **")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *  *        ")
	 elseif i==3 then
	io.write(string.rep(" ",count).."    *   *     ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."       *  *   ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."         *  * ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==8 then
	io.write(string.rep(" ",count).." * *  * * * * ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."  * * * *  *  ")
     end

	elseif num=="6" then
		if i==0 then
	io.write(string.rep(" ",count).."         *  * ")
	 elseif i==1 then
	io.write(string.rep(" ",count).."       *  *   ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."　    *  *    ")
	 elseif i==3 then
	io.write(string.rep(" ",count).."    *  *  *   ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."  *  *  *  *  ")
	 elseif i==5 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* *       *  *")
	 elseif i==8 then
	io.write(string.rep(" ",count).." * *  * * * * ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."  * * * *  *  ")
     end

	elseif num=="7" then
		if i==0 then
	io.write(string.rep(" ",count).."* * * * * * **")
	 elseif i==1 then
	io.write(string.rep(" ",count).."* * * * * * **")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *      *  * ")
	 elseif i==3 then
	io.write(string.rep(" ",count).."       *  *   ")
	 elseif i==4 then
	io.write(string.rep(" ",count).."    *  *      ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."    *  *      ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."    *  *      ")
	 elseif i==7 then
	io.write(string.rep(" ",count).."    *  *      ")
	 elseif i==8 then
	io.write(string.rep(" ",count).."    *  *      ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."    ****      ")
     end

	elseif num=="8" then
		if i==0 then
	io.write(string.rep(" ",count).."    * ** *    ")
	 elseif i==1 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==3 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==4 then
	io.write(string.rep(" ",count).."   *  **  *   ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."   *  **  *   ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==8 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."    * ** *    ")
     end

	elseif num=="9" then
		if i==0 then
	io.write(string.rep(" ",count).."  * * * *  *  ")
	 elseif i==1 then
	io.write(string.rep(" ",count).." * *  * * * * ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==3 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==4 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==5 then
	io.write(string.rep(" ",count).."  *  *   * *  ")
	 elseif i==6 then
	io.write(string.rep(" ",count).."       * *    ")
	 elseif i==7 then
	io.write(string.rep(" ",count).."     *  *     ")
	 elseif i==8 then
	io.write(string.rep(" ",count).."　 *  *       ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."*  *          ")
     end

	elseif num=="0" then
		if i==0 then
	io.write(string.rep(" ",count).."    * ** *    ")
	 elseif i==1 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==2 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==3 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==4 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==5 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==6 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==7 then
	io.write(string.rep(" ",count).."* *        * *")
	 elseif i==8 then
	io.write(string.rep(" ",count).." *  *    *  * ")
	 elseif i==9 then
	io.write(string.rep(" ",count).."    * ** *    ")
     end

	end
end


function numChoice2(number)
	for i=0,9 do
	  count = 2
	  for num in string.gmatch(string.format("%s",number),"%d")do
		numEnter2(num,count,i)
        -- count= count + 1
	  end
	  io.write("\n")
	end
end
numChoice2(1234567890)


function strEnter(str,count,i)
	if str=="A" then
      if i==0 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==1 then
	io.write("  *  *  *     "..string.rep(" ",count))
	 elseif i==2 then
	io.write("  *  *  *     "..string.rep(" ",count))
	 elseif i==3 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==4 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==5 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==6 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==7 then
	io.write("     *  *     "..string.rep(" ",count))
	 elseif i==8 then
	io.write("* *  *  *  * *"..string.rep(" ",count))
	 elseif i==9 then
	io.write("* *  *  *  * *"..string.rep(" ",count))
     end
    end
end


function strChoice(string)
	for i=0,9 do
		count = 2
		for str in string.gmatch(string,"%a")do
			strEnter(str,count,i)
		end
	end
	io.write("\n")
end
-- strChoice("str")

function printA()
	io.write("      ***     \n")
	io.write("     * * *    \n")
	io.write("    *    *    \n")
	io.write("     *   *    \n")
	io.write("     *    *   \n")
	io.write("     *    *   \n")
	io.write("     *  *  *  \n")
	io.write("   * *   * *  \n")
	io.write(" * *      * * \n")
	io.write("* *        * *\n")
end
function printB()
	io.write("      ***     \n")
	io.write("     * * *    \n")
	io.write("    *    *    \n")
	io.write("     *   *    \n")
	io.write("     *    *   \n")
	io.write("     *    *   \n")
	io.write("     *  *  *  \n")
	io.write("   * *   * *  \n")
	io.write(" * *      * * \n")
	io.write("* *        * *\n")
end
function printC()
	io.write("    * ** *    \n")
	io.write(" *  *    *  * \n")
	io.write("* *        * *\n")
	io.write("* *           \n")
	io.write("* *           \n")
	io.write("* *           \n")
	io.write("* *           \n")
	io.write("* *        * *\n")
	io.write(" *  *    *  * \n")
	io.write("    * ** *    \n")
end





