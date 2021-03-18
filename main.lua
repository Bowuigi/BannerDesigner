#!/usr/bin/luajit

function split(Str, Separator)
	Separator=Separator or '%s'
	local t={}
	for field,s in string.gmatch(Str, "([^"..Separator.."]*)("..Separator.."?)") do
		t[#t+1]=field
		if s=="" then
			return t
		end
	end
end

function fill(str,fill,size)
	for i=#str,size,1 do
		str=str..fill
	end
	return str
end

function truncate(str,size)
	return str:sub(0,size)
end

local color = arg[1] or 9
local title = arg[2] or "BannerDesigner"
local titlecmd = "figlet -t -f slant '"..title.."'"
local titlefile=io.popen(titlecmd)
local title=titlefile:read("*a")
local titletable = split(title,"\n")
titlefile:close()

io.write("\027[1;37m")
-- Open the box
for i=1,#titletable[1]+4 do
	if i==1 then
		io.write("╭")
	elseif i==#titletable[1]+4 then
		io.write("╮")
	else
		io.write("─")
	end
end

io.write("\n")

-- Print the title
for i=1,#titletable-1 do
	io.write("│ ","\027[1;3"..color.."m",titletable[i],"\027[1;37m"," │","\n")
end

if arg[3] then
	-- Cut the box
	for i=1,#titletable[1]+4 do
		if i==1 then
			io.write("├")
		elseif i==#titletable[1]+4 then
			io.write("┤")
		else
			io.write("─")
		end
	end
	io.write("\n")
end

-- Print the messages
for i=3,#arg do
	local printstr="│ "..truncate(fill(arg[i]," ",#titletable[1]),#titletable[1]).." │"
	print(printstr)
end


-- Close the box
for i=1,#titletable[1]+4 do
	if i==1 then
		io.write("╰")
	elseif i==#titletable[1]+4 then
		io.write("╯")
	else
		io.write("─")
	end
end

io.write("\027[0m")