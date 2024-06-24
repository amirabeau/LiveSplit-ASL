state("NineSols") {}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
	vars.Helper.GameName = "NineSols";
	vars.Helper.LoadSceneManager = true;
	vars.Helper.AlertLoadless();

  vars.CompletedSplits = new HashSet<string>();
  vars.abilities = new Dictionary<string, string> { { "Mystic Nymph", "skills_HackDroneAbility" }, { "Tai Chi Counter", "skills_ParryJumpKickAbility" }, { "Azure Bow", "skills_ArrowAbility" }, { "Charged Strike", "skills_ChargedAttackAbility" }, { "Air Dash", "skills_RollDodgeInAirUpgrade" }, { "Unbounded Counter", "skills_ParryCounterAbility" }, { "Double Jump", "skills_AirJumpAbility" }, { "Super Mutant Buster", "skills_KillZombieFooAbility" } };

  // god i wish there was an easier way of doing this 
  vars.abilityrooms = new Dictionary<string, string> { { "Tai Chi Counter Room", "room_Taichi" }, { "Charged Strike Room", "room_Charged" }, { "Air Dash", "room_Airdash" }, { "Unbounded Counter Room", "room_Unbounded" }, { "Double Jump Room", "room_DoubleJump" } };
  vars.vrmemory = new Dictionary<string, string> { { "Kuafu Seal", "room_KuafuVR" }, { "Goumang Seal", "room_GoumangVR" }, { "Yanlao Seal", "room_YanlaoVR" }, { "Jiequan Seal", "room_JiequanVR" }, { "Fake Lady Ethereal Seal", "room_fakeFudie" }, { "After Lady Ethereal fight", "room_Butterfly" }, { "Ji Seal", "room_JiVR" }, { "Fuxi Seal", "room_FuxiVR" }, { "Nuwa Seal", "room_NuwaVR" }, { "Eigong Soulscape", "room_EigongSoulscape" } };
  vars.roomIndexes = new Dictionary<string,int> { { "room_KuafuVR", 66 }, { "room_GoumangVR", 67 }, { "room_YanlaoVR", 68 }, { "room_JiequanVR", 69 }, { "room_fakeFudie", 70 }, { "room_Butterfly", 52 },{ "room_JiVR", 89 }, { "room_FuxiVR", 90 }, { "room_NuwaVR", 91 }, { "room_EigongSoulscape", 103 }, { "room_Taichi", 58 }, { "room_Charged", 59 }, { "room_Airdash", 60 }, { "room_Unbounded", 61 }, { "room_DoubleJump", 63 } };
	settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on existing Save");
  settings.SetToolTip("fileselect_start", "For starting timer when selecting any existing save. Don't use with new save file creation.");

  settings.Add("ability_obtain", false, "Split on exiting Ability Tutorial rooms");
  foreach (var ability in vars.abilities) { 
    settings.Add(ability.Value, false, ability.Key, "ability_obtain"); 
  }
  settings.Add("ability_exit", false, "Split on Ability map exit");
  foreach (var abilityroom in vars.abilityrooms) { 
    settings.Add(abilityroom.Value, false, abilityroom.Key, "ability_exit"); 
  }

  settings.Add("seal_obtain", false, "Split on Seal obtain");
  foreach (var vrmemory in vars.vrmemory) { 
    settings.Add(vrmemory.Value, false, vrmemory.Key, "seal_obtain"); 
  }
  settings.Add("eigong_kill", false, "Split on Eigong Kill (experimental)");
}

init
{
  current.SceneIndex = 0;
   vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {

      var AppCore = mono["ApplicationCore",1];
      var GameCore = mono["GameCore",1];
       vars.Helper["loadingscreen"] = AppCore.Make<bool>("_instance","loadingScreen",0x78); // When loading screen is active
       vars.Helper["levelloading"] = GameCore.Make<bool>("_instance","gameLevel",0x1b8);  // When level is finishing the load
      //  vars.Helper["gamestate"] = GameCore.Make<int>("_instance","_currentCoreState"); //wow there was an actual loading state

       vars.Helper["savefilestart"] = AppCore.Make<bool>("_instance","IsPlayFromTitleScreen"); 

       vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","gameModeFlag"); 

      /* Skills */ 
       vars.Helper["skills_HackDroneAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xf8,0x17a); 
       vars.Helper["skills_ParryJumpKickAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xa8,0x17a); 
       vars.Helper["skills_ArrowAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x110,0x17a); 
       vars.Helper["skills_ChargedAttackAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xe8,0x17a); 
       vars.Helper["skills_RollDodgeInAirUpgrade"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xc0,0x17a); 
       vars.Helper["skills_ParryCounterAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x100,0x17a); 
       vars.Helper["skills_AirJumpAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x108,0x17a); 
       vars.Helper["skills_KillZombieFooAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x118,0x17a); 
       
       /* Boss States */ 
       vars.Helper["SlowMotion"] = mono["TimePauseManager",1].Make<float>("_instance","gamePlayTimeScaleModifier", 0x30); 

       vars.Helper["PhaseIndex"] = GameCore.Make<int>("_instance","player", 0x4c8,0x418); 
      //  vars.Helper["LastEnemyPostureFinish"] = GameCore.Make<bool>("_instance","player", 0x4c8,0x398,0x90); 
       return true;
   });
}

start {
  if (settings["fileselect_start"] 
    && (vars.Helper["savefilestart"].Current != vars.Helper["savefilestart"].Old)
  ) { 
    return vars.Helper["savefilestart"].Current; 
  }
  else {
      /* Start timer when intro cutscene begins */ 
      if ((old.SceneIndex != current.SceneIndex) && (current.SceneIndex == 7))
      { 
        return true;
      }
  }
}

onStart {
  vars.CompletedSplits.Clear();
}

isLoading
{
  /* (vars.Helper["gamestate"] == 2) is changing scenes, in case needed to rewrite this */ 
  return (vars.Helper["loadingscreen"].Current || (!vars.Helper["levelloading"].Current) || (current.SceneIndex == 0) || (current.SceneIndex == 72) || (current.SceneIndex == 7));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;
}

reset 
{
  if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1) { return true; }
}


split {
  
  /* Split on Ability obtain (on the first triggers) */ 
    foreach (var ability in vars.abilities) {
      if (settings[ability.Value] && vars.Helper[ability.Value].Current != vars.Helper[ability.Value].Old) {
        print("splitting for: " + ability);
        return true && vars.CompletedSplits.Add(ability.Value);
      }
    }

  /* Split on Ability room exit,  */ 
    foreach (var abilityroom in vars.abilityrooms) {
      if (settings[abilityroom.Value] && old.SceneIndex != current.SceneIndex && vars.roomIndexes[abilityroom.Value] == old.SceneIndex) {
        print("splitting for: " + abilityroom);
        return true && vars.CompletedSplits.Add(abilityroom.Value);
      }
    }
    /* Split on exiting VR memory rooms*/
    foreach (var vrmemory in vars.vrmemory) {
      if (settings[vrmemory.Value] && old.SceneIndex != current.SceneIndex && vars.roomIndexes[vrmemory.Value] == old.SceneIndex)
      {
        print("splitting for: " + vrmemory);
          return true && vars.CompletedSplits.Add(vrmemory.Value);
      }
    }

    /* Split on Eigong Kill (experimental) */
    if(settings["eigong_kill"]) {
      if (vars.Helper["SlowMotion"].Current != vars.Helper["SlowMotion"].Old 
      && vars.Helper["SlowMotion"].Current < 0.05 
      && vars.Helper["PhaseIndex"].Current >= 1 
      && ((current.SceneIndex == 104) || (current.SceneIndex == 113)) ){
        return true && vars.CompletedSplits.Add("eigong_kill");
      }
    }
}
/*
Scenes:
0 - Blank / Load
1 - "TitleScreenMenu" - Title Screen
72 - "ClearTransition"
7 - "A0_S6_Intro_Video" - Intro Video
5 - "A0_S4_tutorial" - Intro Tutorial

51 - Lady E fight
52 - Post Lady E butterfly cutscene
58 - TaiChi Kick
59 - Charge Attack
60 - Air Dash
61 - Unbound Counter
62 - 
63 - Double Jump
66 - Kuafu Memory
67 - Goumang Memory
68 - Yanlao Memory
69 - Jiequan Memory
70 - Lady E Memory
89 - Ji Memory
90 - Fuxi Memory
91 - Nuwa Memory
103 - Eigong Soulscape
104 - Eigong Fight
113 - True Eigong Fight question mark
 */