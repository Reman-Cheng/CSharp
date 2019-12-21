print("2".."6")
print(2+"6")
print(string.format("the value is:%d","4"))
taba = {"the value is:%d","4",4}
print(#taba)
print(math.pow(256,4))

print(package.path)
print(package.loadfile)

mytable = setmetatable({1},{2})
a = getmetatable(mytable)
print(a[1])

a={1,2,5,4,99,66,55}
table.sort(a)
for k,v in ipairs(a) do
	print(k,v)
end
ResultTable = {}
function checkBCDC()
   -- doDiagsCmd("reg select D2483\n")
   -- local reSend,recv = doDiagsCmd("reg read 0x501C\n")
   recv = "0x501C => 0x00"
   local BCDCrecv = string.match(recv or "","0x501C%s*=>%s*(%w+)")
   print(BCDCrecv)
   local BCDCrecv1 = tonumber(BCDCrecv)
   if BCDCrecv == nil then
      bResult = false
      bLog = "the command return Nil or error"
   else
      if BCDCrecv1>0 then
          bResult = false
          bLog = "fail for cell disconnect,the value is higher than 0"
      else
      	  bResult = true
          bLog = "Battery cell disconnect check the reg value:"..BCDCrecv
      end
   end
     ResultTable.resultString = bLog
     ResultTable.resultCode = bResult
end
print("----==pcall==----")
pcall(checkBCDC,{})
print("----==pcall==----")
print(ResultTable.resultCode,ResultTable.resultString)

str1 = "strigntofind"
print(string.sub(str1,2,4))

lcm_sn = "F5G91530KZ1M83W1GCM1G6005JG1CPEDB8491450F952100221D2C91270AA5M8T0101G1"
print(#lcm_sn,type(string.sub(lcm_sn,1,17)))

TestItems = {}
table.insert(TestItems,{name="Add Attribute - LCM_SN",action=itemAddAttribute1,arr = {0,17},key = "LCM_SN"})
table.insert(TestItems,{name="Add Attribute - LCM_CFG",action=itemAddAttribute1,arr = {17,20},key = "LCM_CFG"})
table.insert(TestItems,{name="Add Attribute - BLU_SN",action=itemAddAttribute1,arr = {26,50},key = "BLU_SN"})
table.insert(TestItems,{name="Add Attribute - CGS_SN",action=itemAddAttribute1,arr = {50,67},key = "CGS_SN"})
table.insert(TestItems,{name="Add Attribute - CGS_CFG",action=itemAddAttribute1,arr = {67,70},key = "CGS_CFG"})
print(TestItems[1].name,string.sub(lcm_sn,TestItems[1].arr[1]+1,TestItems[1].arr[2]))
function itemAddAttribute1(self)
  local SFCvalue = lcm_sn
  -- print("---==---",SFCvalue)
  if SFCvalue == "" or type(SFCvalue) ~= "string" then
      bRt = false
      bLog = "Get SFC Info - ".."lcm_sn".."Fail"
  elseif #SFCvalue ~= 70 then
      bRt = false
      bLog = "Get SFC Info - lcm_sn is not 70 length"
  else
      bRt = true
      bLog = "Get SFC Info - "..self.key..": "..string.sub(SFCvalue,self.arr[1]+1,self.arr[2]).." Pass"
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
  print(ResultTable.resultCode,ResultTable.resultString)
end
print("====-----======")
itemAddAttribute1({arr = {0,17},key = "LCM_SN"})
for i=1,#TestItems do
	print("====--for--======")
	rt,rinfo = pcall(TestItems[i].action,TestItems[i])
	print(rt,rinfo)
end
for i=1,#TestItems do
	print("====--#TestItems--======")
	itemAddAttribute1(TestItems[i])
end


g_tbSFCInfo = {lcm_sn = "F5G91530KZ1M83W1GCM1G6005JG1CPEDB8491450F952100221D2C91270AA5M8T0101G1"}
function itemCompare70SNAndEEPROM()
  -- rtSend,rtRecv = doDiagsCmd("display -m serial_number\n")
     rtRecv = "Panel LCM#: F5G91530KZ1M83W1G   CM1G6005JG1CPEDB8491450F952100221D2C91270AA5M8T0101G1 OK"
     rtRecv = tostring(rtRecv)
  if g_tbSFCInfo["lcm_sn"] == nil or #g_tbSFCInfo["lcm_sn"] ~= 70 then
      bRt = false
      bLog = "lcm_sn from SFC not found or invalid"
      return 0
  end
  if true then
      rtRecv1 = string.match(rtRecv or "","Panel LCM#: (%w+%s+%w+)")
      print(rtRecv1)
   rtRecv2 = ""
    for v in string.gmatch(rtRecv1 or "","(%w+)") do
    rtRecv2 = rtRecv2..v
    -- print(v,rtRecv2)
    end
    if g_tbSFCInfo["lcm_sn"] ~= rtRecv2 then
      bRt = false
      bLog = "lcm_sn from SFC: " .. tostring(g_tbSFCInfo["lcm_sn"]) .. " is not the same with EEPROM: " .. tostring(rtRecv2)
    else
      CompareLCMSNResult = true
      bRt = true
      bLog = "lcm_sn from SFC: " .. tostring(g_tbSFCInfo["lcm_sn"]) .. " is the same with EEPROM: " .. tostring(rtRecv2)
    end
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemCompare70SNAndEEPROM()
print("=-itemCompare70SNAndEEPROM-=",ResultTable.resultCode,ResultTable.resultString)


function  itemCheckLCDVendor()
  if CompareLCMSNResult == false then
      bRt = false
      bLog = "item 'Compare LCM 70 digits SN from SFC and EEPROM' test FAIL, so no need to test and FAIL"  
      return 0
  end
  if g_tbSFCInfo["lcm_sn"] == nil or #g_tbSFCInfo["lcm_sn"] ~= 70 then
      bRt = false
      bLog = "lcm_sn from SFC not found or invalid"
      return 0
  end
  vendor = string.sub(g_tbSFCInfo["lcm_sn"],1,3)
  if vendor == "F0Y" or vendor == "FN1" then
      bRt = true
      bLog = "LCD vendor:"..vendor.."CLCD_ID LGD"
  elseif vendor == "F5G" then
      bRt = true
      bLog = "LCD vendor:"..vendor.."CLCD_ID GIS"
  else
      bRt = false
      bLog = "Unknow vendor code: " .. vendor
      return 0
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemCheckLCDVendor()
print("=-itemCheckLCDVendor-=",ResultTable.resultCode,ResultTable.resultString)

function itemBurnLCDSN()
  SFCvalue = g_tbSFCInfo["lcm_sn"]
  if SFCvalue == "" or type(SFCvalue) ~= "string" then
    bRt = false
    bLog = "failMessage: "..tostring(SFCvalue)
  end
  -- rtSend,cmdRecv = doDiagsCmd("syscfg print LCM#\n")
  cmdRecv = "F5G91530KZ1M83W1G    CM1G6005JG1CPEDB8491450F952100221D2C91270AA5M8T0101G1"
  cmdRecv = string.match(cmdRecv or "","(%w+%s+%w+)")
  cmdRecv1 = ""
  for ret in string.gmatch(cmdRecv or "","(%w+)") do
      cmdRecv1 = cmdRecv1..ret
    end
  if cmdRecv1 == SFCvalue then
    bRt = true
    bLog = "No need to burn!"
  elseif cmdRecv1 ~= SFCvalue then
    -- rtSend,retmsg = doDiagsCmd("syscfg add LCM# " .. SFCvalue.."\n")
    retmsg = "F5G91530KZ1M83W1GCM1G6005JG1CPEDB8491450F952100221D2C91270A  A5M8T0101G1   Finish!"
    star,end1 = string.find(retmsg or "","Finish!")
    str = string.sub(retmsg,star,end1)
    if str == "Finish!" then
    bRt = true
    bLog = "finish to burn!"
    else
      bRt = false
      bLog = "burn false"
    end
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemBurnLCDSN()
print("=-itemBurnLCDSN-=",ResultTable.resultCode,ResultTable.resultString)

function itemRBLCDSN()
  SFCvalue = g_tbSFCInfo["lcm_sn"]
  -- Atlas.create_record(["LCD SN From SFC:"+SFCvalue], True)
  if SFCvalue == "" or type(SFCvalue) ~= "string" then
    bRt = false
    bLog = "failMessage: "..tostring(SFCvalue)
  end
  -- reSend,cmdRecv = doDiagsCmd("syscfg print LCM#\n")
  cmdRecv = "F5G91530KZ1M83W1G    CM1G6005JG1CPEDB8491450F952100221D2C91270AA5M8T0101G1"
  cmdRecv = string.match(cmdRecv or "","(%w+%s+%w+)")
  cmdRecv1 = ""
  for ret in string.gmatch(cmdRecv or "","(%w+)") do
      cmdRecv1 = cmdRecv1..ret
    end
  if cmdRecv1 == SFCvalue then
    bRt = true
    bLog =  "LCD SN From Unit: "..cmdRecv1
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemRBLCDSN()
print("=-itemRBLCDSN-=",ResultTable.resultCode,ResultTable.resultString)

function itemBurnGrapeSN()
  grapeSNLen = 17
  SFCvalue = g_tbSFCInfo["lcm_sn"]
  -- print(type(SFCvalue)=="string")
  if SFCvalue == "" or type(SFCvalue) ~= "string" then
    bRt = false
    bLog = "failMessage: "..tostring(SFCvalue)
  end
  Grape_SN = string.sub(SFCvalue,51,67)
  if #Grape_SN ~= grapeSNLen then
    bRt = false
    bLog = "failMessage The length of Grape SN is not correct, Grape_SN: " .. tostring(Grape_SN)
  end
  -- reSend,cmdRecv = doDiagsCmd("syscfg print MtSN\n")
  cmdRecv = "D2C91270AA5M8T010"
  cmdRecv = string.match(cmdRecv or "","(%w+)")
  if cmdRecv == Grape_SN then
    bRt = true
    bLog = "No need to burn!"
  elseif cmdRecv ~= Grape_SN then
    -- rtSend,retmsg = doDiagsCmd("syscfg add MtSN " .. SFCvalue.."\n")
    retmsg = "Finish!"
    star,end1 = string.find(retmsg or "","Finish!")
    str = string.sub(retmsg,star,end1)
    if str == "Finish!" then
    bRt = true
    bLog = "finish to burn!"
    else
      bRt = false
      bLog = "burn false"
    end
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemBurnGrapeSN()
print("=-itemBurnGrapeSN-=",ResultTable.resultCode,ResultTable.resultString)

function itemRBGrapeSN()
  grapeSNLen = 17
  SFCvalue = g_tbSFCInfo["lcm_sn"]
  if SFCvalue == "" or type(SFCvalue) ~= "string" then
    bRt = false
    bLog = "failMessage: "..tostring(SFCvalue)
    return 0
  end
  Grape_SN = string.sub(SFCvalue,51,67)
  if #Grape_SN ~= grapeSNLen then
    bRt = false
    bLog = "failMessage The length of Grape SN is not correct, Grape_SN: " .. tostring(Grape_SN)
  end
  -- reSend,cmdRecv = doDiagsCmd("syscfg print MtSN\n")
  cmdRecv = "D2C91270AA5M8T010"
  cmdRecv = string.match(cmdRecv or "","(%w+)")
  if cmdRecv == Grape_SN then
    bRt = true
    bLog = "Grape_SN From Unit:"..cmdRecv
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemRBGrapeSN()
print("=-itemRBGrapeSN-=",ResultTable.resultCode,ResultTable.resultString)

function BurnDummyMdlC()
  -- doDiagsCmd("syscfg add MdlC 0xFN845JH45878923785627895256845TY845UJ845\n")
  -- reSend,recv = doDiagsCmd("syscfg print MdlC\n")
  recv = "0xFN845JH45878923785627895256845TY845UJ845"
   print("-----------recv---------",recv)
  recv1 = string.match(recv,"0x(%w+)")
  print("-----------recv1---------",recv1)
  if #recv1 ~= 40 then
    bRt = false
    bLog = "diag return error"
   return 0
  end
  if recv1 == "FN845JH45878923785627895256845TY845UJ845"then
    bRt = true
    bLog = "Burn Dummy MdlC TRUE"
  else
    bRt = false
    bLog = "Burn Dummy MdlC false diag return :"..recv1
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
BurnDummyMdlC()
print("=-BurnDummyMdlC-=",ResultTable.resultCode,ResultTable.resultString)

-- _,_,logresult = string.find(recv or "","(5JH45)")
-- print(logresult)

function compareAandB(strValue,LowerLimit,upperLimit,containEqual)
  if strValue == nil or tonumber(strValue) == nil then
    return false
  end
  local BValue = false
  if (upperLimit == "NA" or upperLimit == "N/A") and (LowerLimit == "NA" or LowerLimit == "N/A") then
    BValue =  true
  elseif LowerLimit == "NA" or LowerLimit == "N/A" then
    local strValueNum, upperLimitNum = tonumber(strValue), tonumber(upperLimit)
    if containEqual == "true" or containEqual == "True" or containEqual == "TRUE" or containEqual == true then
      BValue = strValueNum <= upperLimitNum and true or false
    else
      BValue = strValueNum < upperLimitNum and true or false
    end
  elseif upperLimit == "NA" or upperLimit == "N/A" then
    local strValueNum, LowerLimitNum = tonumber(strValue), tonumber(LowerLimit)
    if containEqual == "true" or containEqual == "True" or containEqual == "TRUE" or containEqual == true then
      BValue = strValueNum >= LowerLimitNum and true or false
    else
      BValue = strValueNum > LowerLimitNum and true or false
    end 
  else
    local strValueNum, LowerLimitNum, upperLimitNum = tonumber(strValue), tonumber(LowerLimit), tonumber(upperLimit)
    if containEqual == "true" or containEqual == "True" or containEqual == "TRUE" or containEqual == true then
      BValue = strValueNum <= upperLimitNum and strValueNum >= LowerLimitNum and true or false
    else
      BValue = strValueNum < upperLimitNum and strValueNum > LowerLimitNum and true or false
    end
  end
  return BValue
end

reRecv = [[
accel:
# of samples captured: 100

# of bad samples (corrupted/lost): 0
calculate
d odr: 198.731766Hz

average: X = -0.009929, Y = 0.002131, Z = 0.997764, T = 30.568904

std-dev: X = 0.001102, Y = 0.001046, Z = 0.002320, T = 0.024417

rms:     X = 0.009990, Y = 0.002374, Z = 0.997766, T = 30.568914

min: X = -0.012451, Y = 0.000244, Z = 0.992691, T = 30.511001

max: X = -0.007324, Y = 0.0058
59, Z = 1.002227, T = 30.605865

 	range: X = 0.005126, Y = 0.005615, Z = 0.009536, T = 0.094863

median: X = -0.010009, Y = 0.002197, Z = 0.998062, T = 30.575271

gyro:

# of samples captured: 100
	# of bad samples (corrupted/lost): 0
	calculated odr: 198.732169Hz

	average: X = 0.034179, Y = 0.397339, Z = 0.130004, T = 30.568904
 	std-dev: X = 0.070821, Y = 0.073494, Z = 0.066107, T = 0.024417

 	rms:     X = 0.078638, Y = 0.404079, Z = 0.145847, T = 30.568914

min: X = -0.122070, Y = 0.244140, Z = -0.061035, T = 30.511001
	max: X = 0.183105, Y = 0.610366, Z = 0.244140, T = 30.605865

	range: X = 0.305175, Y = 0.366226, Z = 0.305175, T = 0.094863

	median: X = 0.061035, Y = 0.427246, Z = 0.122070, T = 30.575271
 OK]]
-- print(reRecv)
reCMRecv = string.gsub(reRecv or "","\n","")
-- print(reCMRecv)
re1 = string.match(reCMRecv or "","accel:# of samples captured:.*average: (.*).*rms:.*gyro:")
 -- Z = ([%.%d]+), T = .*std-dev: X = ([%.%d]+), Y = ([%.%d]+), Z = ([%.%d]+),.*gyro:.*calculated odr: ([%.%d]+)Hz.*average: X = ([%.%d]+), Y = ([%.%d]+), Z = ([%.%d]+), T = ([%.%d]+).*std-dev: X = ([%.%d]+), Y = ([%.%d]+), Z = ([%.%d]+), T = .*OK")
tab1 = {}
for v in string.gmatch(re1 or "", "= ([-%.%d]*)")do
	table.insert(tab1,v)
end
for k,v in ipairs(tab1) do
	print(k,v)
end
re2 = string.match(reCMRecv or "","gyro:# of samples captured:.*average: (.*).*rms:")
tab2 = {}
for v in string.gmatch(re2 or "", "= ([-%.%d]*)")do
	table.insert(tab2,v)
end
for k,v in ipairs(tab2) do
	print(k,v)
end
-- print(tab1[2])
-- print(tab2[1])
function itemCMtestPara1(self)
   targetStr = tab1[self.limitSet.Captures]
   cresult = compareAandB(targetStr or "",self.limitSet.lower,self.limitSet.upper,true)
   bRt = cresult
   bLog = self.name..": "..targetStr
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemCMtestPara1({name ="CM_Accel_Average_X",limitSet = {lower=-0.118, upper=0.118, Captures = 1}})
print("=-itemCMtestPara1-=",ResultTable.resultCode,ResultTable.resultString)

function itemCompassVersion()
  
  -- doDiagsCmd("sensorreg -s compass -r 0x00 1\n")
  -- rtSend,rtRevc = doDiagsCmd("sensorreg -s compass -r 0x01 1\n")
  rtRevc = [[Reading in 1 registers from 0x1:
    0x01 = 0x40
    OK]]
    rtRecv = string.gsub(rtRecv,"\n","")
  if rtRevc ~= "" then
    VA_Magnetometer_Version = string.match(rtRevc, "0x01 = (%w+)",1)
    if VA_Magnetometer_Version == "0x40" then
      bRt = true
      bLog = "VA_Magnetometer_ChipID: "..VA_Magnetometer_Version
    else
      bRt = false
      bLog = "Expect: 0x40 but got: "..VA_Magnetometer_Version
    end
  else
    bRt = false
    bLog = "sensorreg -s compass -r 0x01 return Fail"
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemCompassVersion()
print("=-itemCompassVersion-=",ResultTable.resultCode,ResultTable.resultString)

function itemMagnetometerREV()
  -- rtSend,registerX = doDiagsCmd("sensorreg -s compass -r 0x02\n")
  registerX = [[Reading in 1 registers from 0x2:
 0x02 = 0x52
 OK]]
 register = string.gsub(registerX or "","\n","")
 registerX = string.match(register or "","0x02 = (%w+)")
  if registerX == "0x52" then
     MagnetmeterREV = "0x52"
  else
     bRt = false
     bLog = "Expect: 0x52 but got: "..tostring(registerX)
  end
  bRt = true
  bLog = "VA_Magnetometer_REV Expect: 0x52 and got: "..tostring(MagnetmeterREV)
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemMagnetometerREV()
print("=-itemMagnetometerREV-=",ResultTable.resultCode,ResultTable.resultString)

function Mag_CRC()
    crcArray  = {}
    CRCValue1 = nil
    CRCValue2 = nil

    -- doDiagsCmd("sensorreg -s compass -w 0x29 0x53\n")
    -- doDiagsCmd("sensorreg -s compass -w 0x2A 0x47\n")
    -- cmdRecv = doDiagsCmd("sensorreg -s compass -r 0x40 62\n")
    cmdRecv = [[Reading in 62 registers from 0x40:
0x40 = 0x68
0x41 = 0xF2
0x42 = 0xF2

0x43 = 0x92
0x44 = 0x0A
0x45 = 0xDA
0x46 = 0xD4
0x47 = 
0x5E
0x48 = 0x4A
0x49 = 0x17
0x4A = 0xB0
0x4B = 0x4B
0x4C = 
0xE7
0x4D = 0x07
0x4E = 0x93
0x4F = 0xC4
0x50 = 0x00

0x51 = 0xC3
0x52 = 0x13
0x53 = 0xE0
0x54 = 0x74
0x55 = 0xB8

0x56 = 0x5D
0x57 = 0xCF
0x58 = 0x53
0x59 = 0x06
0x5A = 0x0B

 0x5B = 0x24
 0x5C = 0x89
 0x5D = 0x85
0x5E = 0x82
 0x5F = 
0x16
0x60 = 0x0F
 0x61 = 0xB3
 0x62 = 0x3C
 0x63 = 0xFF
 0x64 = 
 0xD0
 0x65 = 0xBA
 0x66 = 0xFF
 0x67 = 0x0E
0x68 = 0x9F

0x69 = 0x44
0x6A = 0xAC
0x6B = 0xEA
0x6C = 0x4E
0x6D = 0x41

0x6E = 0x30
0x6F = 0xFA
0x70 = 0xF7
 0x71 = 0x05
0x72 = 
0xFF
0x73 = 0x10
 0x74 = 0x31
 0x75 = 0x20
 0x76 = 0xF8
 0x77 = 
0x91
0x78 = 0x01
0x79 = 0xA9
0x7A = 0x10
0x7B = 0x34

0x7C = 0xAB
0x7D = 0x52
OK]]
cmdRecv = string.gsub(cmdRecv or "","\n"," ")
for v in string.gmatch(cmdRecv or "","=%s+(%w+)")do
  table.insert(crcArray,v)
end
    print("-------------crcArray-------------",crcArray)
    for k,v in pairs(crcArray) do
    	print(k,v)
    end
 if true then
      rtnTmp = 0xFFFF
      for k,v in ipairs(crcArray) do      
        CRC_calculated = CRCCalculate(rtnTmp, v)
        rtnTmp = CRC_calculated
        print("===CalValue===: ", CRC_calculated)
      end
      -- rtSend,CRC_read0 = doDiagsCmd("sensorreg -s compass -r 0x04\n")
      CRC_read0 = [[Reading in 1 registers from 0x4:
      0x04 = 0x29
      OK]]
      CRC_read1 = string.gsub(CRC_read0 or "","\n","")
      CRC_read0 = string.match(CRC_read1 or "","0x04 =%s+(%w+)")
      -- rtSend,CRC_read1 = doDiagsCmd("sensorreg -s compass -r 0x03\n")
      CRC_read1 = [[Reading in 1 registers from 0x3:
      0x03 = 0x2D
      OK]]
      CRC_read2 = string.gsub(CRC_read1 or "","\n","")
      CRC_read1 = string.match(CRC_read2 or "","0x03 =%s+(%w+)")
      print("--==CRC_read0==--",CRC_read0)
      print("--==CRC_read1==--",CRC_read1)
      -- CRC_read0 = tonumer(CRC_read0)
      -- CRC_read1 = tonumer(CRC_read1)
      -- CRC_read = (CRC_read0 << 8) & CRC_read1
      CRC_read1 = string.match(CRC_read1 or "","0x(%w+)")
      CRC_read = CRC_read0..CRC_read1
      print("--==CRC_read==--",tonumber(CRC_read))

      if (tonumber(CRC_read) == tonumber(CRC_calculated)) then
        bRt = true
        bLog = "CRC read from register: " .. tostring(CRC_read) .." is not equal with CRC calculated: " .. tostring(CRC_calculated).." "
        CRC_valid_range = {0x0001, 0xFFFF}
        is_CRC_valid = (CRC_calculated >= CRC_valid_range[1]) and (CRC_calculated <= CRC_valid_range[2])
        if is_CRC_valid == false then
           bRt = false
           bLog = "CRC is not in range " .. tostring(CRC_valid_range)
        end
      end
    end
    ResultTable.resultCode = bRt
    ResultTable.resultString = bLog
end
function CRCCalculate(crc, byteSource)
  checkSum = (crc ~ (byteSource << 8))
  for i = 0, 7 do
    if (checkSum&0x8000 > 0) then
      checkSum  = ((checkSum << 1)~ 0x1021) 
    else
      checkSum = (checkSum <<1)  
    end
  end
  checkSum = (checkSum & 0xFFFF)
  return checkSum
end
Mag_CRC()
print("=-Mag_CRC-=",ResultTable.resultCode,ResultTable.resultString)

function itemCompass(self)

  -- doDiagsCmd("sensor --listsensors\n")
  -- doDiagsCmd("sensor --sel compass --init\n")  
  -- rtSend,compassRecv = doDiagsCmd("sensor --sel compass --sample 1000ms --stats\n")
compassRecv = [[
compass:
 # of samples captured: 100

# of bad samples (corrupted/lost): 0
  calculated odr: 99.632174Hz

  average: X = 40.936075, Y = 106.507908, Z = -298.862950, T = 27.552030
 
  std-dev: X = 0.218499, Y = 0.215100, Z = 0.311997, T = 0.059320

 rms:     X = 40.936658, Y = 106.508125, Z = 298.863113, T = 27.552094

  min: X = 40.499572, Y = 105.898910, Z = -299.846939, T = 27.380310
 
 max: X = 41.549575, Y = 106.798904, Z = -297.896957, T = 27.692520
 
  range: X = 1.050003, Y = 0.899993, Z = 1.949981, T = 0.312210
 
  median: X = 40.949569, Y = 106.498901, Z = -298.946945, T = 27.536422
 OK]]
  compassRecv = string.gsub(compassRecv or "","\n"," ")
  VA_Magnetometer_ODR = string.match(compassRecv or "","compass:.*calculated odr:%s+([-%.%d]*).*rms:.*OK")
  if VA_Magnetometer_Version == "0x40" then
   cresult = compareAandB(VA_Magnetometer_ODR or "",self.limitSet.lower,self.limitSet.upper,true)
   bRt = cresult
   bLog = "get "..tostring(VA_Magnetometer_ODR).."is in the limit"
  else
    bRt = false
    bLog = "Unexcepted Magnetversion: " + VA_Magnetometer_Version
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemCompass({limitSet = {lower=90, upper=110, Captures = 1},name="VA_Magnetometer_ODR"})
print("=-itemCompass-=",ResultTable.resultCode,ResultTable.resultString)

function itemMagetometer(self)
	compassVal = {}
	compassRecv = string.match(compassRecv or "","compass:.*average:%s+(.*).*rms:.*OK")
	print(compassRecv)
	for v in string.gmatch(compassRecv or "","=%s+([-%.%d]*)")do
        table.insert(compassVal,v)
    end
  -- for k,v in pairs(compassVal)do
  -- 	print(k,v)
  -- end
  para_value = tonumber(compassVal[self.limitSet.Captures])
  cresult = compareAandB(compassVal[self.limitSet.Captures] or "",self.limitSet.lower,self.limitSet.upper,true)
  bRt = cresult
  bLog = "get "..tostring(compassVal[self.limitSet.Captures]).." is in the limit"
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemMagetometer({limitSet = {lower=-1200, upper=1200, Captures = 1},name="VA_Magnetometer_ODR"})
print("=-itemMagetometer-=",ResultTable.resultCode,ResultTable.resultString)

function itemProxID(self)
  testPara = nil
  if self.name == "PROX_QT_DEV_ID" then
      -- doDiagsCmd("sensor --sel prox --init\n")
      -- rtSend,testPara = doDiagsCmd("sensor --sel prox --get device_id\n")
      testPara = [[
      prox:

      device_id = 0xD0
     OK]]
        testPara = string.gsub(testPara or "","\n"," ")
        testPara = string.match(testPara or "","=%s+(%w+)")
        bRt = true
        bLog = "itemProxID: "..testPara
  elseif self.name == "PROX_QT_REV_ID" then
        -- testPara = doDiagsCmd("sensor --sel prox --get rev_id\n")
       testPara = [[prox:
     rev_id = 
      0x12
     OK]]
     testPara = string.gsub(testPara or "","\n"," ")
        testPara = string.match(testPara or "","=%s+(%w+)")
         bRt = true
        bLog = "itemProxID: "..testPara
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemProxID({name="PROX_QT_DEV_ID",action=itemProxID})
print("=-itemProxID-=",ResultTable.resultCode,ResultTable.resultString)
itemProxID({name="PROX_QT_REV_ID",action=itemProxID})
print("=-itemProxID-=",ResultTable.resultCode,ResultTable.resultString)

function itemPROXSN()
  -- rtSend,cmdRecv = doDiagsCmd("sensor --sel prox --get serial_num\n")
  cmdRecv= [[prox:
 serial_num = 
 FWP905511ELJJ7Y15
 OK]]
  testPara = string.gsub(cmdRecv or "","\n"," ")
        PROXSN = string.match(testPara or "","=%s+(%w+)") 
   if PROXSN ~= nil then
        bRt = true
        bLog = "proxSN: "..PROXSN
  else
        bRt = false
        bLog = "proxSN return Error!"
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemPROXSN({name="PROX SN",action=itemPROXSN})
print("=-itemPROXSN-=",ResultTable.resultCode,ResultTable.resultString)

function itemProxNoTargetTest(self)
 
  -- doDiagsCmd("sensor --sel prox --set datatype norm\n")
  -- doDiagsCmd("sensor --sel prox --set fixed_odr 60\n")
  -- doFixtureCmd_RPC("cylinder_", "PROXON")
  -- sleep(1.5)
  -- rtSend,ProxNoTarget = doDiagsCmd("sensor --sel prox --sample 47 --stats\n")
  ProxNoTarget = [[
  Stats:
2019-05-09 16:37:25.528 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.528 rawuart-rt--read[2221]: <Info> prox:
2019-05-09 16:37:25.528 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.532 rawuart-rt--read[2221]: <Info>  # of samples captured: 47
2019-05-09 16:37:25.532 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.538 rawuart-rt--read[2221]: <Info>  # of bad samples (corrupted/lost): 0
2019-05-09 16:37:25.538 rawuart-rt--read[2221]: <Info>  calculated odr: 59.958588Hz
2019-05-09 16:37:25.538 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.563 rawuart-rt--read[2221]: <Info>  average: rawrange = 27.038526
2019-05-09 16:37:25.563 rawuart-rt--read[2221]: <Info>  average: signalrateperspad 
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info> = 39.847706, ambientrateperspad = 0.800333
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info>  average: refsignalrateperspad = 594.425177
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info>  average: totalsignalrate = 4505.416914, totalambientrate = 90.490437
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info>  average: totalrefsignalrate = 4160.976243
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info>  average: integrationtime = 9989.182880
2019-05-09 16:37:25.569 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.594 rawuart-rt--read[2221]: <Info>  std-dev: rawrange = 1.548807
2019-05-09 16:37:25.594 rawuart-rt--read[2221]: <Info>  std-dev: signalrateperspad = 0.228923, ambientrateperspad = 0.109604
2019-05-09 16:37:25.594 rawuart-rt--read[2221]: <Info>  std-dev: refsignalrateperspad = 6.223761
2019-05-09 16:37:25.594 rawuart-rt--read[2221]: <Info>  std-dev: totalsignalrate = 25.883460, totalambientrate = 12.392492
2019-05-09 16:37:25.594 rawuart-rt--read[2221]: <Info>  std-dev: totalrefsignalrate = 43.56
2019-05-09 16:37:25.598 rawuart-rt--read[2221]: <Info> 6328
2019-05-09 16:37:25.598 rawuart-rt--read[2221]: <Info>  std-dev: integrationtime = 0.000000
2019-05-09 16:37:25.598 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:37:25.618 rawuart-rt--read[2221]: <Info>  rms: rawrange = 27.082848
2019-05-09 16:37:25.618 rawuart-rt--read[2221]: <Info>  rms: signalrateperspad = 39.848364, ambientra
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info> teperspad = 0.807803
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info>  rms: refsignalrateperspad = 594.457758
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info>  rms: totalsignalrate = 4505.491263, totalambientrate = 91.335060
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info>  rms: totalrefsignalrate = 4161.204311
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info>  rms: integrationtime = 9989.182880
2019-05-09 16:37:25.624 rawuart-rt--read[2221]: <Info> OK
  ]]
  ProxNoTarget = string.gsub(ProxNoTarget or "","\n"," ")
  arrNoTarget = {}
  for v in string.gmatch(ProxNoTarget or "","=%s+([-.%d]+)") do
     table.insert(arrNoTarget,v)
    end
    for k,v in pairs(arrNoTarget) do
    	print(k,v)
    end
   ResultTable.resultCode = true
  ResultTable.resultString = tostring(self.name).." value: "..arrNoTarget[self.Captures]
  -- doDiagsCmd("sensor --sel prox --turnoff\n")
  -- doFixtureCmd_RPC("cylinder_", "PROXOFF")
  -- Atlas.create_record([para1],numerify(Globals.m[para2][para1]),limits[para1]["units"],limits[para1])
end
itemProxNoTargetTest({name="PROX SN",action=itemPROXSN,Captures = 1})
print("=-itemProxNoTargetTest-=",ResultTable.resultCode,ResultTable.resultString)

function itemProxTest(self)
  ResultTable.resultCode = true
  ResultTable.resultString = self.name.." value: "..arrNoTarget[self.Captures]
end
itemProxTest({name="PROX_QT_NO_TARGET_RAW_DIST_STD",action=itemProxTest,Captures = 9})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_SIG_AVE",action=itemProxTest,Captures = 2})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_SIG_STD",action=itemProxTest,Captures = 10})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_AMB_AVE",action=itemProxTest,Captures = 3})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_AMB_STD",action=itemProxTest,Captures = 11})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_REF_SIG_AVE",action=itemProxTest,Captures = 4})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)
itemProxTest({name="PROX_QT_NO_TARGET_REF_SIG_STD",action=itemProxTest,Captures = 12})
print("=-itemProxTest-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS1DeviceID(self)
  -- doDiagsCmd("sensor --sel als1 --init\n")
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x39 0x92 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0x92 into 0x674C8498, buffer read: 
Data:  0xE8]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0xE8" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS1DeviceID({name="ALS1_FH_RIGHT_Device ID",action=itemALS1DeviceID})
print("=-itemALS1DeviceID-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS1RevisionID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x39 0x91 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0x91 into 0x674C8498, buffer read:  
 Data:  0x00]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0x00" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS1RevisionID({name="ALS1_FH_RIGHT_Revision ID",action=itemALS1RevisionID})
print("=-itemALS1RevisionID-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS1vendorID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x39 0x91 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0xE2 into 0x674C8498, buffer read: 
 Data:  0x01]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0x01" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS1vendorID({name="ALS1_FH_RIGHT_IC vendor",action=itemALS1vendorID})
print("=-itemALS1vendorID-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS1ChipID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x39 0xE3 0x04\n")
  ALS1DeviceID = [[Reading 4 bytes from register offset 0xE3 into 0x674C8498, buffer read: 
 Data:  0x52  0xC9  0xE0  0x04]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:  ([%s%w]+)")
  if alsRegax == "0x52  0xC9  0xE0  0x04" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS1ChipID({name="ALS1_FH_RIGHT_Chip ID",action=itemALS1ChipID})
print("=-itemALS1ChipID-=",ResultTable.resultCode,ResultTable.resultString)

function itemParseALS1(self)
  -- doFixtureCmd_RPC("cylinder_","ALSON")
  -- doFixtureCmd_RPC("led_","ALS1ON")
  -- doFixtureCmd_RPC("led_","ALS2ON")
  -- sleep(0.5)
  -- doDiagsCmd("sensor --sel als1 --init\n")
  -- doDiagsCmd("sensor --sel als1 --set gain 8\n")
  -- doDiagsCmd("sensor --sel als1 --set integration_cycles 148\n")
  -- rtSend,rtRecv = doDiagsCmd("sensor --sel als1 --sample 3 --stream\n")
  rtRecv =[[ Capturing 3 samples from:
2019-05-09 16:38:10.218 rawuart-rt--read[2221]: <Info> als1 @ 2.42 Hz
2019-05-09 16:38:10.218 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:10.223 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:10.223 rawuart-rt--read[2221]: <Info> Output format = abstime : relativetime : sample
2019-05-09 16:38:10.223 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:10.648 rawuart-rt--read[2221]: <Info> als1:     1794s:808573us (+00s:000000us) = 
2019-05-09 16:38:10.658 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000082, Channel1 = 0x000000B0, Channel2 = 0x0000006D, Channel3 = 0x000001A7
2019-05-09 16:38:10.658 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:11.063 rawuart-rt--read[2221]: <Info> als1:     1795s:224877us (+00s:416304us) = 
2019-05-09 16:38:11.073 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000082, Channel1 = 0x000000B0, Channel2 = 0x0000006D, Channel3 = 0x000001A8
2019-05-09 16:38:11.073 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:11.483 rawuart-rt--read[2221]: <Info> als1:     1795s:641464us (+00s:416587us) = 
2019-05-09 16:38:11.488 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000082, Channel1 = 0x000000B0, Channel2 = 0x0000006D, Channel3 = 0x000001A8
2019-05-09 16:38:11.488 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:11.493 rawuart-rt--read[2221]: <Info> OK]]
rtRecv = string.gsub(rtRecv or "","\n"," ")
rtRecv1 = {}
  for v in string.gmatch(rtRecv or "","=%s+0x(%w+)")do
    table.insert(rtRecv1,"0x"..v)
  end
  for k,v in pairs(rtRecv1)do
  	print(k,v)
  end
  Globals = {}
  Globals.m = {}
  if true then
    Globals.m["Sensor ALS1_FH_RIGHT Bright -Ch_0"] = (tonumber(rtRecv1[1])+tonumber(rtRecv1[2])+tonumber(rtRecv1[3])) / 3.0
    Globals.m["Sensor ALS1_FH_RIGHT Bright -Ch_1"] = (tonumber(rtRecv1[4])+tonumber(rtRecv1[5])+tonumber(rtRecv1[6])) / 3.0
    Globals.m["Sensor ALS1_FH_RIGHT Bright -Ch_2"] = (tonumber(rtRecv1[7])+tonumber(rtRecv1[8])+tonumber(rtRecv1[9])) / 3.0
    Globals.m["Sensor ALS1_FH_RIGHT Bright -Ch_3"] = (tonumber(rtRecv1[10])+tonumber(rtRecv1[11])+tonumber(rtRecv1[12])) / 3.0
    cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
    bRt = cresult
    bLog = self.name..": "..Globals.m[self.name].." is in the limits"
 end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemParseALS1({name="Sensor ALS1_FH_RIGHT Bright -Ch_0",action=itemParseALS1,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS0-=",ResultTable.resultCode,ResultTable.resultString)

function  itemParseALS(self)
  cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
    bRt = cresult
    bLog = self.name..": "..Globals.m[self.name].." is in the limits"
    ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemParseALS({name="Sensor ALS1_FH_RIGHT Bright -Ch_1",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS1-=",ResultTable.resultCode,ResultTable.resultString)
itemParseALS({name="Sensor ALS1_FH_RIGHT Bright -Ch_2",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS2-=",ResultTable.resultCode,ResultTable.resultString)
itemParseALS({name="Sensor ALS1_FH_RIGHT Bright -Ch_3",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS3-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS2DeviceID(self)
  -- doDiagsCmd("sensor --sel als2 --init\n")
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x29 0x92 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0x92 into 0x67074E18, buffer read: 
 Data:  0xE8 ]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0xE8" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS2DeviceID({name="ALS2_FH_LEFT_Device ID",action=itemALS2DeviceID})
print("=-itemALS2DeviceID-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS2RevisionID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x29 0x91 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0x91 into 0x67074E18, buffer read:  
Data:  0x00]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0x00" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS2RevisionID({name="ALS2_FH_LEFT_Revision ID",action=itemALS2RevisionID})
print("=-itemALS2RevisionID-=",ResultTable.resultCode,ResultTable.resultString)

function itemALS2vendorID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x29 0xE2 0x01\n")
  ALS1DeviceID = [[Reading 1 bytes from register offset 0xE2 into 0x67074E18, buffer read:  
 Data:  0x53]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:%s+(%w+)")
  if alsRegax == "0x53" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS2vendorID({name="ALS2_FH_LEFT_IC vendor",action=itemALS2vendorID})
print("=-itemALS2vendorID-=",ResultTable.resultCode,ResultTable.resultString)


function itemALS2ChipID(self)
  -- rtSend,ALS1DeviceID = doDiagsCmd("i2c -d 6 0x29 0xE3 0x04\n")
  ALS1DeviceID = [[Reading 4 bytes from register offset 0xE3 into 0x67074E18, buffer read:  
Data:  0x37 
0x07  0xA4  0x04]]
  ALS1DeviceID = string.gsub(ALS1DeviceID or "","\n"," ")
  alsRegax = string.match(ALS1DeviceID or "","Data:  ([%w%s]+)")
  if alsRegax == "0x52  0xC9  0xE0  0x04" then
    bRt = true
    bLog = self.name..": "..alsRegax
  else
    bRt = false
    bLog = "the command return unexpectvalue: "..alsRegax
  end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemALS2ChipID({name="ALS2_FH_LEFT_Chip ID",action=itemALS1itemALS2ChipIDChipID})
print("=-itemALS2ChipID-=",ResultTable.resultCode,ResultTable.resultString)


function itemParseALS2(self)
  -- sleep(0.5)
  -- doDiagsCmd("sensor --sel als2 --init\n")
  -- doDiagsCmd("sensor --sel als2 --set gain 8\n")
  -- doDiagsCmd("sensor --sel als2 --set integration_cycles 148\n")
  -- rtSend,rtRecv = doDiagsCmd("sensor --sel als2 --sample 3 --stream\n")
  -- doDiagsCmd("sensor --sel als1,als2 --turnoff\n")
  rtRecv =[[Capturing 3 samples from:
2019-05-09 16:38:12.272 rawuart-rt--read[2221]: <Info> als2 @ 2.42 Hz
2019-05-09 16:38:12.272 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:12.277 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:12.277 rawuart-rt--read[2221]: <Info> Output format = abstime : relativetime : sample
2019-05-09 16:38:12.277 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:12.692 rawuart-rt--read[2221]: <Info> als2:     1796s:853671us (+00s:000000us) = 
2019-05-09 16:38:12.702 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000060, Channel1 = 0x00000086, Channel2 = 0x0000005B, Channel3 = 0x00000143
2019-05-09 16:38:12.702 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:13.102 rawuart-rt--read[2221]: <Info> als2:     1797s:261575us (+00s:407904us) = 
2019-05-09 16:38:13.107 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000060, Chan
2019-05-09 16:38:13.112 rawuart-rt--read[2221]: <Info> nel1 = 0x00000086, Channel2 = 0x0000005B, Channel3 = 0x00000143
2019-05-09 16:38:13.112 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:13.507 rawuart-rt--read[2221]: <Info> als2:     1797s:668913us (+00s:407338us) = 
2019-05-09 16:38:13.517 rawuart-rt--read[2221]: <Info> Channel0 = 0x00000060, Channel1 = 0x00000086, Channel2 = 0x0000005C, Channel3 = 0x00000144
2019-05-09 16:38:13.517 rawuart-rt--read[2221]: <Info> OK]]
rtRecv = string.gsub(rtRecv or "","\n"," ")
rtRecv1 = {}
  for v in string.gmatch(rtRecv or "","=%s+0x(%w+)")do
    print(v)
    table.insert(rtRecv1,"0x"..v)
  end
  Globals.m = {}
  if true then
    Globals.m["Sensor ALS2_FH_LEFT Bright -Ch_0"] = (tonumber(rtRecv1[1])+tonumber(rtRecv1[2])+tonumber(rtRecv1[3])) / 3.0
    Globals.m["Sensor ALS2_FH_LEFT Bright -Ch_1"] = (tonumber(rtRecv1[4])+tonumber(rtRecv1[5])+tonumber(rtRecv1[6])) / 3.0
    Globals.m["Sensor ALS2_FH_LEFT Bright -Ch_2"] = (tonumber(rtRecv1[7])+tonumber(rtRecv1[8])+tonumber(rtRecv1[9])) / 3.0
    Globals.m["Sensor ALS2_FH_LEFT Bright -Ch_3"] = (tonumber(rtRecv1[10])+tonumber(rtRecv1[11])+tonumber(rtRecv1[12])) / 3.0
    cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
    bRt = cresult
    bLog = self.name..": "..Globals.m[self.name].." is in the limits"
 end
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemParseALS2({name="Sensor ALS2_FH_LEFT Bright -Ch_0",action=itemParseALS2,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS0-=",ResultTable.resultCode,ResultTable.resultString)


function  itemParseALS(self)
  cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
    bRt = cresult
    bLog = self.name..": "..Globals.m[self.name].." is in the limits"
    ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
end
itemParseALS({name="Sensor ALS2_FH_LEFT Bright -Ch_1",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS1-=",ResultTable.resultCode,ResultTable.resultString)
itemParseALS({name="Sensor ALS2_FH_LEFT Bright -Ch_2",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS2-=",ResultTable.resultCode,ResultTable.resultString)
itemParseALS({name="Sensor ALS2_FH_LEFT Bright -Ch_3",action=itemParseALS,limitSet = {lower=5, upper=65534, Captures = 4}})
print("=-itemParseALS3-=",ResultTable.resultCode,ResultTable.resultString)


function itemDBCl()
  -- doDiagsCmd("zerofile nandfs:\\AppleInternal\\Diags\\Logs\\Smokey\\LcmCal\\PDCA.plist\n")
  -- doDiagsCmd("zerofile nandfs:\\AppleInternal\\Diags\\Logs\\Smokey\\LcmCal\\Smokey.log\n")
  -- doDiagsCmd("smokeyshell -r\n") 
  -- doDiagsCmd("smokey --run LcmCal\n") 
  -- Globals.m["DBDTValue"] = doDiagsCmd("cat nandfs:\\AppleInternal\\Diags\\Logs\\Smokey\\LcmCal\\PDCA.plist\n")
  Globals.m["DBDTValue"] = [[
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info> <plist version="1.0">
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info> <dict>
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info>  <key>0</key>
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info>  <dict>
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info>    <key>Attributes</key>
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info>    <dict>
2019-05-09 16:38:15.108 rawuart-rt--read[2221]: <Info>      <key>serialnumber
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info> </key>   <string>DLXYK00DMK1V</string>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>      <key>softwarename</key>   <string>LcmCal</string>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>      <key>softwareversion</key><string>20190405</string>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>    </dict>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>    <key>Tests</key>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>    <array>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>      <dict>
2019-05-09 16:38:15.113 rawuart-rt--read[2221]: <Info>        <key>testname</key>       <string>LcmCal</stri
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info> ng>
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info>        <key>subtestname</key>    <string>SequenceVersion</string>
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info>        <key>result</key>         <string>PASS</string>
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info>        <key>value</key>          <string>20190405</string>
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info>        <key>lowerlimit</key>     <string>NA</string>
2019-05-09 16:38:15.118 rawuart-rt--read[2221]: <Info>        <key>upperlimit</
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info> key>     <string>NA</string>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>        <key>units</key>          <string>NA</string>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>        <key>priority</key>       <string>0</string>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>      </dict>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>      <dict>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>        <key>testname</key>       <string>LcmCal</string>
2019-05-09 16:38:15.123 rawuart-rt--read[2221]: <Info>        <key>subtestname</key>    <string>Conve
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info> rtLcmCal: DBCl</string>
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info>        <key>subsubtestname</key> <string>Iteration 1</string>
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info>        <key>result</key>         <string>PASS</string>
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info>        <key>value</key>          <string>3</string>
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info>        <key>lowerlimit</key>     <string>NA</string>
2019-05-09 16:38:15.128 rawuart-rt--read[2221]: <Info>        <key>upp
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info> erlimit</key>     <string>NA</string>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>        <key>units</key>          <string>NA</string>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>        <key>priority</key>       <string>0</string>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>      </dict>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>      <dict>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>        <key>testname</key>       <string>LcmCal</string>
2019-05-09 16:38:15.133 rawuart-rt--read[2221]: <Info>        <key>subtestname</key>    <str
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info> ing>ConvertLcmCal: DTCl</string>
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info>        <key>subsubtestname</key> <string>Iteration 1</string>
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info>        <key>result</key>         <string>PASS</string>
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info>        <key>value</key>          <string>2</string>
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info>        <key>lowerlimit</key>     <string>NA</string>
2019-05-09 16:38:15.138 rawuart-rt--read[2221]: <Info>      
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>  <key>upperlimit</key>     <string>NA</string>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>        <key>units</key>          <string>NA</string>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>        <key>priority</key>       <string>0</string>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>      </dict>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>      <dict>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>        <key>testname</key>       <string>LcmCal</string>
2019-05-09 16:38:15.143 rawuart-rt--read[2221]: <Info>        <key>subtestname</key
2019-05-09 16:38:15.148 rawuart-rt--read[2221]: <Info> >    <string>ConvertLcmCal</string>
2019-05-09 16:38:15.148 rawuart-rt--read[2221]: <Info>        <key>subsubtestname</key> <string>Iteration 1</string>
2019-05-09 16:38:15.148 rawuart-rt--read[2221]: <Info>        <key>result</key>         <string>PASS</string>
2019-05-09 16:38:15.148 rawuart-rt--read[2221]: <Info>        <key>value</key>          <string>NA</string>
2019-05-09 16:38:15.148 rawuart-rt--read[2221]: <Info>        <key>lowerlimit</key>     <string>NA</string>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>        <key>upperlimit</key>     <string>NA</string>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>        <key>units</key>          <string>NA</string>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>        <key>priority</key>       <string>0</string>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>      </dict>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>    </array>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>    <key>overallresult</key><string>PASS</string>
2019-05-09 16:38:15.153 rawuart-rt--read[2221]: <Info>    <key>startTime</key>    
2019-05-09 16:38:15.157 rawuart-rt--read[2221]: <Info> <string>2019-05-09 08:38:14+0000</string>
2019-05-09 16:38:15.157 rawuart-rt--read[2221]: <Info>    <key>stopTime</key>     <string>2019-05-09 08:38:15+0000</string>
2019-05-09 16:38:15.157 rawuart-rt--read[2221]: <Info>  </dict>
2019-05-09 16:38:15.157 rawuart-rt--read[2221]: <Info> </dict>
2019-05-09 16:38:15.157 rawuart-rt--read[2221]: <Info> </plist>
]]
Globals.m["DBDTValue"] = string.gsub(Globals.m["DBDTValue"] or "","\n"," ")
overallresult = string.match(Globals.m["DBDTValue"] or "","<key>overallresult</key><string>(%w+)</string>")
  -- sleep(2)
  DBDT = {}
  for v in string.gmatch(Globals.m["DBDTValue"],"<key>value</key>%s+<string>(%d+)</string>")do
     table.insert(DBDT,v)
  end
  print("DBDTValue ========= ",Globals.m["DBDTValue"])
  print("DBDTValue ===overallresult====== ",overallresult)
 
  DBCl_result = overallresult == "PASS" and true or false
  ResultTable.resultCode = DBCl_result
  ResultTable.resultString = "DBCl: " .. tostring(DBDT[2])
end
itemDBCl({name="DBCl",action=itemDBCl})
print("=-itemDBCl-=",ResultTable.resultCode,ResultTable.resultString)

function itemDTCl()
 DBCl_result = overallresult == "PASS" and true or false
  ResultTable.resultCode = DBCl_result
  ResultTable.resultString = "DBCl: " .. tostring(DBDT[3])
end
itemDTCl({name="DTCl",action=itemDTCl})
print("=-itemDTCl-=",ResultTable.resultCode,ResultTable.resultString)

------------------------------HALL----------------------------------------------------

function itemHALL_TCON2MissTest()

   doFixtureCmd_RPC("test_", "HALL0NOFF\n")
   doDiagsCmd("hallsensor --irqindex 1 --meas 6 --delay 500\n")

end
function itemHALL_TCON2DetectTest()
   
    doFixtureCmd_RPC("test_", "HALL0SON")
    doDiagsCmd("hallsensor --irqindex 1 --meas 6 --delay 500\n")
    doFixtureCmd_RPC("test_", "HALL0SOFF")
    sleep(0.1)
 
end
function itemHALL_C3MissTest()
 
  doFixtureCmd_RPC("cylinder_", "HALL1OFF")
  doDiagsCmd("hallsensor --irqindex 0 --meas 6 --delay 500\n")
end
function itemHALL_C3DetectTest()
  
  doFixtureCmd_RPC("cylinder_", "HALL1ON")
  doDiagsCmd("hallsensor --irqindex 0 --meas 6 --delay 500\n")
  
  doFixtureCmd_RPC("cylinder_", "HALL1OFF")
  sleep(0.1)
end
------------------------------MicTest----------------------------------------------------
function itemMicTest(self)
  -- doDiagsCmd("camisp --dbgfw on\n")
  -- doDiagsCmd("camisp --find\n")
  -- doDiagsCmd("audio -r\n")
  -- doDiagsCmd("audioparam -b spk_fh_l_w -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_fh_l_t -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_fh_r_w -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_fh_r_t -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_cn_l_w -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_cn_l_t -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_cn_r_w -s -n amp-short -v true\n")
  -- doDiagsCmd("audioparam -b spk_cn_r_t -s -n amp-short -v true\n")
  
  -- doDiagsCmd("routeaudio -b socpdm -i ap-dec0 -o ap-pdm -r\n")
  -- doDiagsCmd("routeaudio -b socpdm -i ap-dec1 -o ap-pdm -r\n")
  -- doDiagsCmd("routeaudio -b socpdm -i ap-dec2 -o ap-pdm -r\n")   
  -- doDiagsCmd("routeaudio -b socpdm -i ap-dec3 -o ap-pdm -r\n") 
  -- doDiagsCmd("processaudio --pick tone-gen --options \"--type sine --freq 3000 --scale 18.8\" --out_channels 0 --out_len 2000 -d 16\n")
  -- doDiagsCmd("processaudio --pick audio-mapper -i process0 --options \"--in [0] --out [0]\" --out_channels 16\n")
  -- doDiagsCmd("playaudio -b socmca -p ap-mca2 --usebuf process1 --async\n")
  -- doDiagsCmd("recordaudio -b socpdm -p ap-pdm --len 2000 --rate 48000 -c 4\n")
  -- doDiagsCmd("stopaudio -b socmca -p ap-mca2\n")
  -- rtSend,MicTestVal = doDiagsCmd("processaudio -p fft -i record0 -o \'--normalize false --minHz 2990 --maxHz 3010\'\n")
  MicTestVal = [[
  Channel 0:
2019-05-09 16:38:26.948 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:26.978 rawuart-rt--read[2221]: <Info> Using 65536 bins, Peak Bin=4094; 
2019-05-09 16:38:26.983 rawuart-rt--read[2221]: <Info> Peak Magnitude=105.640265; Frequency: 2998.535156 
2019-05-09 16:38:26.988 rawuart-rt--read[2221]: <Info> +/- 0.366210 Hz
2019-05-09 16:38:26.988 rawuart-rt--read[2221]: <Info> DC Magnitude=81.732068
2019-05-09 16:38:26.988 rawuart-rt--read[2221]: <Info> Signal Bins=3
2019-05-09 16:38:26.988 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:26.993 rawuart-rt--read[2221]: <Info> SINAD=10.827844 dB
2019-05-09 16:38:26.993 rawuart-rt--read[2221]: <Info> Peak Power: 40.476589 dB
2019-05-09 16:38:26.993 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:26.998 rawuart-rt--read[2221]: <Info> Signal Power: 40.754830 dB
2019-05-09 16:38:26.998 rawuart-rt--read[2221]: <Info> Noise Power: 29.926986 dB
2019-05-09 16:38:26.998 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.003 rawuart-rt--read[2221]: <Info> Average Noise PSD: 19.135174 dB
2019-05-09 16:38:27.003 rawuart-rt--read[2221]: <Info> Noise Margin: 21.341415 dB
2019-05-09 16:38:27.003 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.048 rawuart-rt--read[2221]: <Info> THD+N: -16.777758 dB
2019-05-09 16:38:27.048 rawuart-rt--read[2221]: <Info> Channel 1:
2019-05-09 16:38:27.048 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.083 rawuart-rt--read[2221]: <Info> Using 65536 bins, Peak Bin=4094; Peak Magnitude=79.702941; 
2019-05-09 16:38:27.088 rawuart-rt--read[2221]: <Info> Frequency: 2998.535156 +/- 0.366210 Hz
2019-05-09 16:38:27.088 rawuart-rt--read[2221]: <Info> DC Magnitude=4.532788
2019-05-09 16:38:27.088 rawuart-rt--read[2221]: <Info> Signal B
2019-05-09 16:38:27.093 rawuart-rt--read[2221]: <Info> ins=3
2019-05-09 16:38:27.093 rawuart-rt--read[2221]: <Info> SINAD=10.812123 dB
2019-05-09 16:38:27.093 rawuart-rt--read[2221]: <Info> Peak Power: 38.029486 dB
2019-05-09 16:38:27.093 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.098 rawuart-rt--read[2221]: <Info> Signal Power: 38.310183 dB
2019-05-09 16:38:27.098 rawuart-rt--read[2221]: <Info> Noise Power: 27.498060 dB
2019-05-09 16:38:27.098 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.103 rawuart-rt--read[2221]: <Info> Average Noise PSD: 16.706248 dB
2019-05-09 16:38:27.103 rawuart-rt--read[2221]: <Info> Noise Margin: 21.323238 dB
2019-05-09 16:38:27.103 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.163 rawuart-rt--read[2221]: <Info> THD+N: -16.741564 dB
2019-05-09 16:38:27.163 rawuart-rt--read[2221]: <Info> Channel 2:
2019-05-09 16:38:27.163 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.198 rawuart-rt--read[2221]: <Info> Using 65536 bins, Peak Bin=4094; Peak Magnitude=74.929434; 
2019-05-09 16:38:27.204 rawuart-rt--read[2221]: <Info> Frequency: 2998.535156 +/- 0.366210 Hz
2019-05-09 16:38:27.204 rawuart-rt--read[2221]: <Info> DC Magnitude=81.275098
2019-05-09 16:38:27.204 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.209 rawuart-rt--read[2221]: <Info> Signal Bins=3
2019-05-09 16:38:27.209 rawuart-rt--read[2221]: <Info> SINAD=10.787980 dB
2019-05-09 16:38:27.209 rawuart-rt--read[2221]: <Info> Peak Power: 37.493049 dB
2019-05-09 16:38:27.209 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.213 rawuart-rt--read[2221]: <Info> Signal Power: 37.776529 dB
2019-05-09 16:38:27.213 rawuart-rt--read[2221]: <Info> Noise Power: 26.988548 dB
2019-05-09 16:38:27.213 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.218 rawuart-rt--read[2221]: <Info> Average Noise PSD: 16.196736 dB
2019-05-09 16:38:27.218 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.223 rawuart-rt--read[2221]: <Info> Noise Margin: 21.296312 dB
2019-05-09 16:38:27.223 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.263 rawuart-rt--read[2221]: <Info> THD+N: -14.985961 dB
2019-05-09 16:38:27.263 rawuart-rt--read[2221]: <Info> Channel 3:
2019-05-09 16:38:27.263 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.298 rawuart-rt--read[2221]: <Info> Using 65536 bins, Peak Bin=4094; Peak Magnitude=79.151099; 
2019-05-09 16:38:27.303 rawuart-rt--read[2221]: <Info> Frequency: 2998.535156 +/- 0.366210 Hz
2019-05-09 16:38:27.303 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.308 rawuart-rt--read[2221]: <Info> DC Magnitude=7.870268
2019-05-09 16:38:27.308 rawuart-rt--read[2221]: <Info> Signal Bins=3
2019-05-09 16:38:27.308 rawuart-rt--read[2221]: <Info> SINAD=10.807775 dB
2019-05-09 16:38:27.308 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.313 rawuart-rt--read[2221]: <Info> Peak Power: 37.969139 dB
2019-05-09 16:38:27.313 rawuart-rt--read[2221]: <Info> Signal Power: 38.251659 dB
2019-05-09 16:38:27.313 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.319 rawuart-rt--read[2221]: <Info> Noise Power: 27.443883 dB
2019-05-09 16:38:27.319 rawuart-rt--read[2221]: <Info> Average Noise PSD: 16.652071 dB
2019-05-09 16:38:27.319 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.323 rawuart-rt--read[2221]: <Info> Noise Margin: 21.317067 dB
2019-05-09 16:38:27.323 rawuart-rt--read[2221]: <Info> 
2019-05-09 16:38:27.368 rawuart-rt--read[2221]: <Info> THD+N: -13.102100 dB
2019-05-09 16:38:27.368 rawuart-rt--read[2221]: <Info> OK
]]
MicTestVal = string.gsub(MicTestVal or "","\n"," ")
PK = {}
for v in string.gmatch(MicTestVal or "","Peak Magnitude=([.%w]+)")do
  table.insert(PK,v)
end
DC = {}
for v in string.gmatch(MicTestVal or "","DC Magnitude=([.%w]+)")do
  table.insert(DC,v)
end
  -- for k,v in pairs(DC)do
  -- 	print(k,v)
  -- end
  if true then
   Globals = {}
   Globals.m = {}   
     Globals.m["MIC_EDGE_L_PK_MAG"] = PK[1]
     Globals.m["MIC_EDGE_R_PK_MAG"] = PK[2]
     Globals.m["MIC_TM_PK_MAG"] = PK[3]
     Globals.m["MIC_HOUSING_PK_MAG"] = PK[4]

     Globals.m["MIC_EDGE_L_DC_MAG"] = DC[1]
     Globals.m["MIC_EDGE_R_DC_MAG"] = DC[2]
     Globals.m["MIC_TM_DC_MAG"] = DC[3]
     Globals.m["MIC_HOUSING_DC_MAG"] = DC[4]

    TM_To_HOUSING_PK = tonumber(Globals.m["MIC_TM_PK_MAG"]) - tonumber(Globals.m["MIC_HOUSING_PK_MAG"])
    TM_To_HOUSING_PK = TM_To_HOUSING_PK>0 and TM_To_HOUSING_PK or -TM_To_HOUSING_PK
    print("-----TM_To_BACK_PK-------",tostring(TM_To_HOUSING_PK))
    -- Atlas.create_record([" MIC_TM_PK_MAG to MIC_BACK_PK_MAG delta"], numerify(TM_To_HOUSING_PK), limits["TM_To_HOUSING_PK"]["units"], limits["TM_To_HOUSING_PK"])
    -- Atlas.create_record([" MIC_TM_PK_MAG to MIC_BACK_PK_MAG delta "], TM_To_HOUSING_PK > 2, "Error delta: " + stringify(TM_To_HOUSING_PK) + "; Fail criteria: delta < 2")
    
    EDGE_L_To_EDGE_R_PK = tonumber(Globals.m["MIC_EDGE_L_PK_MAG"]) - tonumber(Globals.m["MIC_EDGE_R_PK_MAG"])
    EDGE_L_To_EDGE_R_PK = EDGE_L_To_EDGE_R_PK > 0 and EDGE_L_To_EDGE_R_PK or -EDGE_L_To_EDGE_R_PK
    print("-----EDGE_L_To_EDGE_R_PK-------",tostring(EDGE_L_To_EDGE_R_PK))
    -- Atlas.create_record([" MIC_EDGE_L_PK_MAG to MIC_EDGE_R_PK_MAG delta"], numerify(EDGE_L_To_EDGE_R_PK), limits["EDGE_L_To_EDGE_R_PK"]["units"], limits["EDGE_L_To_EDGE_R_PK"])

    EDGE_L_To_EDGE_R_DC = tonumber(Globals.m["MIC_EDGE_L_DC_MAG"]) - tonumber(Globals.m["MIC_EDGE_R_DC_MAG"])
    EDGE_L_To_EDGE_R_DC = EDGE_L_To_EDGE_R_DC > 0 and EDGE_L_To_EDGE_R_DC or -EDGE_L_To_EDGE_R_DC
    print("-----EDGE_L_To_EDGE_R_DC-------",tostring(EDGE_L_To_EDGE_R_DC))
    -- Atlas.create_record([" MIC_EDGE_L_DC_MAG to MIC_EDGE_R_DC_MAG delta"], numerify(EDGE_L_To_EDGE_R_DC), limits["EDGE_L_To_EDGE_R_DC"]["units"], limits["EDGE_L_To_EDGE_R_DC"])
    -- cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
		if TM_To_HOUSING_PK > 2 then
		bRt = true
		bLog = self.name..": "..tostring(PK[self.Captures]).." is in the limits"
		else
		bRt = false
		bLog = self.name..": "..tostring(PK[self.Captures]).." is out the limits"
		end
    if (EDGE_L_To_EDGE_R_PK < 0.3) and (EDGE_L_To_EDGE_R_DC < 74 or EDGE_L_To_EDGE_R_DC > 96) then
       -- cresult = compareAandB(Globals.m[self.name] or "",self.limitSet.lower,self.limitSet.upper,true)
       bRt = false
       bLog = "Fail criteria: PK_MAG delta < 0.3 and DC_MAG delta out [74,96]"
      -- Atlas.create_record([" MIC_EDGE_L_PK_MAG to MIC_EDGE_R_PK_MAG delta "], :FALSE:, "Error delta: " + stringify(EDGE_L_To_EDGE_R_PK) + "; Fail criteria: PK_MAG delta < 0.3 and DC_MAG delta out [74,96]")
      -- Atlas.create_record([" MIC_EDGE_L_DC_MAG to MIC_EDGE_R_DC_MAG delta "], :FALSE:, "Error delta: " + stringify(EDGE_L_To_EDGE_R_DC) + "; Fail criteria: PK_MAG delta < 0.3 and DC_MAG delta out [74,96]")
    end  

  end
   -- doDiagsCmd("audio --turnoff\n")
    
    ResultTable.resultCode = bRt
    ResultTable.resultString = bLog
end
itemMicTest({name="SPK_CN_L_W to 4x_MIC Loop Test",action=itemMicTest,Captures = 4})
print("=-itemMicTest-=",ResultTable.resultCode,ResultTable.resultString)
function itemMicTestValue(self)

  cresult = compareAandB(PK[self.Captures] or "",self.limitSet.lower,self.limitSet.upper,true)
  bRt = cresult
  ResultTable.resultCode = bRt
  ResultTable.resultString = self.name.." value: "..tostring(PK[self.Captures])

end
itemMicTestValue({name="TM_To_HOUSING_PK",action=itemMicTestValue, Captures = 4,limitSet = {lower=2, upper="NA"}})
print("=-itemMicTestValue-=",ResultTable.resultCode,ResultTable.resultString)
function itemMicTestValue1(self)

  cresult = compareAandB(DC[self.Captures] or "",self.limitSet.lower,self.limitSet.upper,true)
  bRt = cresult
  ResultTable.resultCode = bRt
  ResultTable.resultString = self.name.." value: "..tostring(DC[self.Captures])

end
itemMicTestValue1({name="MIC_TM_DC_MAG",action=itemMicTestValue1, Captures = 3,limitSet = {lower="NA", upper="NA"}})
print("=-itemMicTestValue1-=",ResultTable.resultCode,ResultTable.resultString)

------------------------------buttons----------------------------------------------------
function buttonsTest_Fixture(self)

  -- doFixtureCmd_RPC("motor_", "POWERON")
  -- sleep(0.8)

  -- Readpower = doFixtureCmd_RPC("motor_","READPOWER")
  Readpower = [[453.90883074]]
  ReadpowerArr = string.match(Readpower,"([-%d.]+)")
  if ReadpowerArr == nil then
     bRt = false
     bLog = "Fail: no return data"
  else 
     cresult = compareAandB(ReadpowerArr or "",self.limitSet1.lower,self.limitSet1.upper,true)
     bRt = cresult
     bLog = "\nPower Button force sensor value: "..tostring(ReadpowerArr).. " is in this limits,"
  end  
 
  -- doFixtureCmd_RPC("motor_", "POWEROFF")

  -- sleep(0.2)
  -- doFixtureCmd_RPC("motor_", "VOLDNON")
  -- sleep(0.8)
  -- Readvoldn = doFixtureCmd_RPC("motor_","READVOLDN")
  Readvoldn = [[408.072098763]]
  ReadvoldnArr = string.match(Readvoldn,"([-%d.]+)")
  if ReadvoldnArr == nil then
     bRt = false
     bLog = "Fail: no return data"
  else
     cresult = compareAandB(ReadvoldnArr or "",self.limitSet2.lower,self.limitSet2.upper,true)
     bRt = cresult
     bLog = bLog .."\nVolume Down force sensor value: "..tostring(ReadvoldnArr).. " is in this limits,"
  end

  -- sleep(0.2)
  -- doFixtureCmd_RPC("motor_", "VOLUPON")
  -- sleep(0.8)

  -- Readpvolup = doFixtureCmd_RPC("motor_","READVOLUP")
  Readpvolup = [[401.295162583]]
  ReadpvolupArr = string.match(Readpvolup,"([-%d.]+)")
  if ReadpvolupArr == nil then
     bRt = false
     bLog = "Fail: no return data"  
  else
     cresult = compareAandB(ReadpvolupArr or "",self.limitSet3.lower,self.limitSet3.upper,true)
     bRt = cresult
     bLog = bLog .."\nVolume Up force sensor value: "..tostring(ReadpvolupArr).. " is in this limits."
  end
     ResultTable.resultCode = bRt
     ResultTable.resultString = bLog
  -- doFixtureCmd_RPC("motor_", "VOLUPOFF")
end
buttonsTest_Fixture({name="PMU Button force sensor value",action=buttonsTest_Fixture,limitSet1 = {lower=266, upper=480},limitSet2 = {lower=266, upper=480},limitSet3 = {lower=266, upper=480}})
print("=-buttonsTest_Fixture-=",ResultTable.resultCode,ResultTable.resultString)

function buttonsTest_Unit(s)
  -- rtSend,Globals.m["Buttons1"] = doDiagsCmd("pmubutton\n")
  Globals.m["Buttons1"] = [[
  2019-05-09 16:38:27.468 rawuart-rt--read[2221]: <Info> 
  2019-05-09 16:38:37.473 rawuart-rt--read[2221]: <Info> Hold:PASS,Ringer:PASS.,VolDown:PASS
  ]]
  Globals.m["Buttons1"] = string.gsub(Globals.m["Buttons1"] , "\n"," ")
  buttons1 = {}
  for v in string.gmatch(Globals.m["Buttons1"] or "",":(%u+)")do
      table.insert(buttons1,v)
  end
end
buttonsTest_Unit()
function buttonsTest_UnitStatus1(self)
     ResultTable.resultCode = buttons1[self.Captures]=="PASS" and true or false
     ResultTable.resultString = self.name.." value: "..buttons1[self.Captures]
end
buttonsTest_UnitStatus1({name="PMU Button Test --Power",action=buttonsTest_UnitStatus1,Captures = 1})
print("=-buttonsTest_UnitStatus1-=",ResultTable.resultCode,ResultTable.resultString)


function itemButtonTest_1(self)
  -- Atlas.call_plugin("Dut", "changeDelimiter",{"delimiter": "To Stop Test"})
  -- doDiagsCmd("buttoncnt", {"timeout": 5})
  -- Atlas.call_plugin("Dut", "changeDelimiter",{"delimiter": "] :-)"})
  -- doFixtureCmd_RPC("motor_", "POWERON")
  -- sleep(1.2)

  -- Readpower = doFixtureCmd_RPC("motor_","READPOWER")
  Readpower = [[455.63386904]]
  ReadpowerArr = string.match(Readpower,"([-%d.]+)")
  if ReadpowerArr == nil then
     bRt = false
     bLog = "Fail: no return data"
  else 
    cresult = compareAandB(ReadpowerArr or "",self.limitSet.lower,self.limitSet.upper,true)
     bRt = cresult
     bLog = self.name..": "..tostring(ReadpowerArr).. " is in this limits."
  end 
  -- doFixtureCmd_RPC("motor_", "POWEROFF")
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
  -- sleep(0.2)
end
itemButtonTest_1({name="Power Button force sensor value2",action=itemButtonTest_1,limitSet = {lower=266, upper=480}})
print("=-itemButtonTest_1-=",ResultTable.resultCode,ResultTable.resultString)

function itemButtonTest_2(self)
  -- doFixtureCmd_RPC("motor_", "VOLDNON")
  -- sleep(0.8)
 
  -- Readvoldn = doFixtureCmd_RPC("motor_","READVOLDN")
  Readvoldn = [[402.280898755]]
  ReadvoldnArr = string.match(Readvoldn,"([-%d.]+)")
  if ReadvoldnArr == nil then
     bRt = false
     bLog = "Fail: no return data"
  else 
    cresult = compareAandB(ReadvoldnArr or "",self.limitSet.lower,self.limitSet.upper,true)
     bRt = cresult
     bLog = self.name..": "..tostring(ReadvoldnArr).. " is in this limits."
  end

  -- doFixtureCmd_RPC("motor_", "VOLDNOFF")
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
  -- sleep(0.2)

end
itemButtonTest_2({name="Volume Down force sensor value2",action=itemButtonTest_1,limitSet = {lower=266, upper=435}})
print("=-itemButtonTest_2-=",ResultTable.resultCode,ResultTable.resultString)

function itemButtonTest_3(self)
  -- doFixtureCmd_RPC("motor_", "VOLUPON")
  -- sleep(0.8)
 
  -- Readvolup = doFixtureCmd_RPC("motor_","READVOLUP")
  Readvolup = [[400.925511519]]
  ReadvolupArr = string.match(Readvolup,"([-%d.]+)",1)
  if ReadvolupArr == nil then
     bRt = false
     bLog = "Fail: no return data"
  else 
     cresult = compareAandB(ReadvolupArr or "",self.limitSet.lower,self.limitSet.upper,true)
     bRt = cresult
     bLog = self.name..": "..tostring(ReadvolupArr).. " is in this limits."
  end
  -- doFixtureCmd_RPC("motor_", "VOLUPOFF")
  -- sleep(0.2)

  -- Atlas.call_plugin("Dut", "changeLineTerminator",{"terminator":""})
  -- rtSend,Globals.m["Buttons2"] = doDiagsCmd("q\n")
  Globals.m["Buttons2"] = [[
    2019-05-09 16:38:45.008 rawuart-rt--read[2221]: <Info>  Hold gets pressed 1 times.
    2019-05-09 16:38:45.008 rawuart-rt--read[2221]: <Info> VolDn gets pressed 1 times.
    2019-05-09 16:38:45.008 rawuart-rt--read[2221]: <Info> VolUp gets pressed 1 times.
    2019-05-09 16:38:45.008 rawuart-rt--read[2221]: <Info> 
    2019-05-09 16:38:45.013 rawuart-rt--read[2221]: <Info> Button Count Test Done.
    2019-05-09 16:38:45.013 rawuart-rt--read[2221]: <Info>
  ]]
  Globals.m["Buttons2"] = string.gsub(Globals.m["Buttons2"] or "","\n"," ")
  buttons2 = {}
  for v in string.gmatch(Globals.m["Buttons2"] or "",">%s+([%w%s]+).")do
    table.insert(buttons2,v)
  end
  -- for k,v in pairs(buttons2)do
  --   print(k,v)
  -- end

  -- Atlas.call_plugin("Dut", "changeLineTerminator",{"terminator":"\n"})
  
  -- doDiagsCmd("bl -l\n")
  ResultTable.resultCode = bRt
  ResultTable.resultString = bLog
  -- sleep(0.2)
end
itemButtonTest_3({name="Volume Up force sensor value2",action=itemButtonTest_3,limitSet = {lower=266, upper=435}})
print("=-itemButtonTest_3-=",ResultTable.resultCode,ResultTable.resultString)

function buttonsTest_UnitStatus2(self)
     ResultTable.resultCode = buttons2[self.Captures]==self.params and true or false
     ResultTable.resultString = self.name.." value: "..buttons2[self.Captures]
end
buttonsTest_UnitStatus2({name="Power Button Test",action=buttonsTest_UnitStatus2,params = "Hold gets pressed 1 times",Captures = 1})
print("=-buttonsTest_UnitStatus2-=",ResultTable.resultCode,ResultTable.resultString)


people = {name = "zhangsan",age = 23}
people.new = function(self)
	local tab = {}
	for k,v in pairs(self)do
		tab[k] = v
	end
	return tab
end
local p = people:new()
print(p.name,p.age)

local x = string.gsub("home = $HOME,user = $USER","%$(%w+)",os.getenv)
print(x)
print(os.getenv("*"))

local x = string.gsub("4+5 = $return 4 + 5$","%$(.-)%$",function(str)
	return load(str)()
end)
print(x)
local x = string.gsub("4+5 = $return 4 + 5$","%$(.-)%$",function(str)
	return str
end)
print(x)

local t ={name = "lua",version = "5.3"}
x = string.gsub("$name-$version.tar.gz","%$(%w+)",t)
print(x)

print(package.path)
















































