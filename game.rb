require 'matrix'
#printing HangMan Start
def showMan(m1)
  i = 0
  m1.each do |number|
    print number + " "
    i+= 1
    if i == m1.column_size
      print "\n"
      i = 0
    end
  end

end
begin
#printing HangMan End
#initialize Data
  puts "------HangMan Game Start-------"
  puts "You have only 4 chance"
  m1 = Matrix[["-","-","-","-","-"],[" "," "," "," ","|"],[" "," "," "," ","|"],[" "," "," "," ","|"],[" "," "," "," ","|"]]
  m2 = Matrix[["-","-","-","-","-"],[" "," ","|"," ","|"],[" "," "," "," ","|"],[" "," "," "," ","|"],[" "," "," "," ","|"]]
  m3 = Matrix[["-","-","-","-","-"],[" "," ","|"," ","|"],[" "," ","O"," ","|"],[" "," "," "," ","|"],[" "," "," "," ","|"]]
  m4 = Matrix[["-","-","-","-","-"],[" "," ","|"," ","|"],[" "," ","O"," ","|"],[" ","/","|","\\","|"],[" "," "," "," ","|"]]
  m5 = Matrix[["-","-","-","-","-"],[" "," ","|"," ","|"],[" "," ","O"," ","|"],[" ","/","|","\\","|"],[" ","/"," ","\\","|"]]
  ary = Array.new
  ary=["hangman","catman","spiderman"]
  i= rand(0...3)
  myWord=ary[i]
  #puts myWord
  ary2 = Array.new
  ary2= myWord.split("")
  sizeWord= ary2.size
  ary3= Array.new
  for i in (0..(sizeWord-1))
    ary3.push("_")
  end

  maxChance=4
  userStatus=m1
  showMan(userStatus)
#initialize Data
#loop start here
  begin
    blankword=""
    ary3.each do |word|
      blankword = blankword+" "+word
    end
    puts "Guess This Word"
    puts blankword

    puts "Please Enter Character"
    userchar=gets.chomp

    collect= ary2.each_index.select{|i| ary2[i].casecmp(userchar) == 0}

    if(collect.size==0)

      maxChance-=1
      if(maxChance==3)
        #showMan(m2)
        userStatus=m2
      end
      if(maxChance==2)
        # showMan(m3)
        userStatus=m3
      end
      if(maxChance==1)
        #showMan(m4)
        userStatus=m4
      end
      if(maxChance==0)
        #showMan(m4)
        userStatus=m5
      end
    else

      collect.each do |index|
        ary3[index]= ary2[index]
      end
    end
    showMan(userStatus)
    if(ary2==ary3)
      win=true
      break
    else
      win=false
    end
  end while maxChance!=0
#loop End here
  if(win)
    puts myWord
    puts "congratulation"
  else
    puts "Correct Word is-->"+myWord
    puts "Sorry You Loosed"
  end
  puts "You Want To Play Again (y/n)"
  userIn=gets.chomp
end while userIn !="n"