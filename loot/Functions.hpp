class loot
{
    class globals
    {
        file = "loot\functions";
        class init {};
        class get {};
        class cleanup {};
        class deleteIfEmpty {};

        class startPreSpawn {};
        class startRevealPreSpawnedLoot {};
        
        class getRealElements {};
        class filter {};
        class generateLootLists {};
        class getBaseWeapons {};
        class getEmptyBackpacks {};
        class sortBackpackTypes {};
        class setLootTypes {};
        class getAttachments {};
    };

    class internal
    {
        file = "loot\functions";

        class randomizeLootRoomIndices {};
        class getRandomLootRoom {};

        class preSpawnLoot {};
        class revealPreSpawnedLoot {};
        class trySpawnKillPoints {};
        class trySpawnLootItem {};
        class trySpawnLootReveal {};
        class trySpawnLootSpinner {};
        class trySpawnSupport {};
    };
};
