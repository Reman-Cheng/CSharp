
function prompt(game)
	print(string.format('系统提示: %s(请选择: yes 代表 是，no 代表 否)',game[1]))
	print '---------菜单---------'
	for k,v in pairs(game[2])do
		print(k)
	end
	print '---------------------'
end

function option1(game)
	print 'you choose: '
	key = io.read()

	local _ret = game[2][key] or game[2][string.lower(key)] or game[2][string.upper(key)]
	while key == nil or _ret == nil do
		print '输入无效，请再次输入(要输入提供的选择哦): '
		key = io.read()
		_ret = game[2][key]
	end

	return _ret
end


function run(game)
	prompt(game)
	local _ret = option1(game)
	ret = _ret[1]

  if ret ~= "quit" then
	if type(ret) == "string" then
		io.write '系统提示: '
		print(ret)
	else
		run(ret)
	end
  else
  	pr = 'quit'
  	print('=======游戏结束=======')

    print('=======游戏退出 输入 os.exit() 退出整个系统=======')
  end
end

function Game(t)
	return t
end

yes_game = Game {
'你承认自己是猪？',
            {
            yes={'承认自己是猪的猪，确实是只猪'},
            no={'否认也没有用，承认吧小猪猪'},
            quit = {"quit"}
            }
        }
no_game = Game {
'否认你也是猪猪？',
            {
            yes={'否认自己是猪的猪'},
            no={'坚持肯定自己不是猪的猪'},
            quit = {"quit"}
            }
        }


yesyes_game = Game {
'继续承认自己是猪？',
            {
            yes={'承认自己是猪的猪，自信自己是只猪'},
            no={'否认也没有用，承认吧小猪猪'},
            quit = {"quit"}
            }
        }
nono_game = Game {
'坚持否认自己是猪？',
            {
            yes={'否认自己是猪的猪'},
            no={'坚持肯定自己不是猪的猪'},
            quit = {"quit"}
            }
        }


pr = nil
print('=======游戏开始=======')
run {
    "你是猪吗？",
    {
    yes= {yes_game},
    no= {no_game},
    quit = {"quit"}
    }
}
run {
    "赶紧承认自己是猪？",
    {
    yes= {yesyes_game},
    no= {nono_game},
    quit = {"quit"}
    }
while pr ~= 'quit' do
	print("please 输入 quit 退出 或 输入 run 继续")
	pr = io.read()
	if string.lower(pr) == 'quit' then
print('=======游戏结束=======')
-- print(string.format('你总共获得%d', total))
print('=======游戏退出 输入 os.exit() 退出整个系统=======')
    else
print('=======游戏继续=======')
-- print(string.format('你总共获得%d', total))    	
    run {
    "赶紧承认自己是猪？",
    {
    yes= {yesyes_game},
    no= {nono_game},
    quit = {"quit"}
    }
}
   end
end






































