class CTITemplateServerFunctions {
	tag = "CTISRV";

	class CTISRVInitialize {
		file = "core\server\functions";

		class addFiveMinuteHearthbeatScript {};
		class addOneSecondHearthbeatScript {};
		class addPostServerInitScript {};
		class addPreServerInitScript {};
		class addSectorActivationScript {};
		class addSectorContestedScript {};
		class addSectorCreatedScript {};
		class addSectorDeActivationScript {};
		class addSectorControlChangeScript {};
		class addSectorLoadedScript {};
		class addSaveScript {};
		class addSectorType {};
		class updateMissionDifficulty {};

		class createOrUpdateIndicationMarker {};
		class createSectorIndicatorName {};
		class deleteIndicatorMarker {};
		class getIconTypeForSector {};
		class setIndicatorMarker {};
		class spawnInvisibleObject {};

		class loadDataBlockInSaveContainer {};
		class storeDataBlockInSaveContainer {};
		class executeSave {};

		class adminChangeSectorOwnership {};
		class adminChangeSectorsOwnership {};
		class adminListSectors {};

		class fillContainerWithContents {};
		class fetchContentOfInventory {};
		class moveInventory {};
		class killUnit {};
	};
};