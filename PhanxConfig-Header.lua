--[[--------------------------------------------------------------------
	PhanxConfig-Header
	Simple options panel header generator. Requires LibStub.
	https://github.com/Phanx/PhanxConfig-Header

	Copyright (c) 2009-2014 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to include copies of this file WITHOUT CHANGES inside World of
	Warcraft addons that make use of it as a library, and feel free to use code
	from this file in other projects as long as you DO NOT use my name or the
	original name of this library anywhere in your project outside of an optional
	credits line -- any modified versions must be renamed to avoid conflicts and
	confusion. If you wish to do something else, or have questions about whether
	you can do something, email me at the address listed above.
----------------------------------------------------------------------]]

local MINOR_VERSION = 172

local lib, oldminor = LibStub:NewLibrary("PhanxConfig-Header", MINOR_VERSION)
if not lib then return end

function lib:New(parent, titleText, notesText, noPrefix)
	assert(type(parent) == "table" and type(rawget(parent, 0)) == "userdata", "PhanxConfig-Header: parent must be a frame")
	if type(titleText) ~= "string" then titleText = nil end
	if type(notesText) ~= "string" then notesText = nil end

	if not titleText then
		titleText = parent.name
	end
	if titleText and not noPrefix and parent.parent then
		titleText = format("%s - %s", parent.parent, titleText)
	end

	local title = parent:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	title:SetPoint("TOPRIGHT", -16, -16)
	title:SetJustifyH("LEFT")
	title:SetText(titleText)

	local notes = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	notes:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
	notes:SetPoint("TOPRIGHT", title, 0, -8)
	notes:SetHeight(32)
	notes:SetJustifyH("LEFT")
	notes:SetJustifyV("TOP")
	notes:SetNonSpaceWrap(true)
	notes:SetText(notesText)

	return title, notes
end

function lib.CreateHeader(...) return lib:New(...) end