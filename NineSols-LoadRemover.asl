state("NineSols") {}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.GameName = "NineSols";
  vars.Helper.LoadSceneManager = true;
  vars.Helper.AlertLoadless();

  vars.lastCheckedSceneIndexForMOBStart = -1;
  vars.mobFlagExists = false;

  vars.CompletedSplits = new HashSet<string>();
  vars.abilities = new Dictionary<string, string> { { "Mystic Nymph", "skills_HackDroneAbility" }, { "Tai Chi Counter", "skills_ParryJumpKickAbility" }, { "Azure Bow", "skills_ArrowAbility" }, { "Charged Strike", "skills_ChargedAttackAbility" }, { "Air Dash", "skills_RollDodgeInAirUpgrade" }, { "Unbounded Counter", "skills_ParryCounterAbility" }, { "Double Jump", "skills_AirJumpAbility" }, { "Super Mutant Buster", "skills_KillZombieFooAbility" } };
    
  vars.memoriesOfBattleBosses = new Dictionary<string, string> { { "Kuafu", "room_kuafu" }, { "Goumang", "room_goumang" },{ "Yanlao", "room_yanlao" }, { "Jiequan", "room_jiequan" }, { "Lady Ethereal", "room_ladyethereal" }, { "Ji", "room_ji" },{ "Fuxi & Nuwa", "room_fuxi" }, { "Eigong", "room_eigong" } };
  
  vars.roomIndexes = new Dictionary<string,int> { { "room_KuafuVR", 66 }, { "room_GoumangVR", 67 }, { "room_YanlaoVR", 68 }, { "room_JiequanVR", 69 }, { "room_fakeFudie", 70 }, { "room_Butterfly", 52 },{ "room_JiVR", 89 }, { "room_FuxiVR", 90 }, { "room_NuwaVR", 91 }, { "room_EigongSoulscape", 103 }, { "room_Taichi", 58 }, { "room_Charged", 59 }, { "room_Airdash", 60 }, { "room_Unbounded", 61 }, { "room_DoubleJump", 63 }, { "baichang_kill", 9 }, { "jiaoduan_kill", 11 },{ "xingtian_kill", 27 }, { "kanghui_kill", 37 }, { "huanxian_kill", 49 }, { "tianshou_kill", 64 },{ "room_kuafu", 14 }, { "room_goumang", 21 },{ "room_yanlao", 29 }, { "room_jiequan", 41 }, { "room_ladyethereal", 51 }, { "room_ji", 88 },{ "room_fuxi", 97 }, { "room_eigong", 104 }, { "trueeigong_kill", 113 }, { "mob_hub", 116 } };
  vars.roomNames = new Dictionary<string,string> { { "room_KuafuVR", "VR_Memory_Kuafu" }, { "room_GoumangVR", "VR_Memory_Goumang" }, { "room_YanlaoVR", "VR_Memory_TaoChang" }, { "room_JiequanVR", "VR_Memory_JieChuan" }, { "room_fakeFudie", "VR_Memory_FuDie" }, { "room_Butterfly", "A7_S6_Memory_Butterfly_CutScene" },{ "room_JiVR", "VR_Memory_Jee" }, { "room_FuxiVR", "VR_Memory_伏羲" }, { "room_NuwaVR", "VR_Memory_伏羲&女娲" }, { "room_EigongSoulscape", "VR_Memory_易公" }, { "room_Taichi", "AG_Tutorial_Lear_S2_??JumpKick" }, { "room_Charged", "AG_Tutorial_Lear_S3_??ChargeAttack" }, { "room_Airdash", "AG_Tutorial_Lear_S4_AirDash_????" }, { "room_Unbounded", "AG_Tutorial_Lear_S5_??ChargedParry" }, { "room_DoubleJump", "AG_Tutorial_Lear_S7_DoubleJump_???" }, { "baichang_kill", "A1_S2_ConnectionToElevator_Final" }, { "xingtian_kill", "A4_S3_ControlRoom_Final" }, { "kanghui_kill", "A5_S2_Jail_Remake_Final" }, { "huanxian_kill", "A7_S2_SectionF_MiniBossFight" }, { "jiaoduan_kill", "A2_S2_ReactorRight_Final" }, { "tianshou_kill", "A9_S1_Remake_4wei" }, { "eigong_kill", "A11_S0_Boss_YiGung" }, { "trueeigong_kill", "A11_S0_Boss_YiGung" }, { "mob_hub", "VR_Challenge_Hub" }};
  
  // Dictionary where we'll insert all game flags we want to track. 
  vars.gameFlags = new Dictionary<string, Tuple<string, string, string>>();

  // Abilities
  vars.gameFlags.Add("f6ddb914baaea4c11a4b995145dbbaadItemData", Tuple.Create("ability_obtain", "Fusang Horn", "GameFlagDescriptable") );
  vars.gameFlags.Add("950f8f3273611424d9b42ab209e8cac8PlayerAbilityData", Tuple.Create("ability_obtain", "Fusang Horn: Teleport", "GameFlagDescriptable") );
  vars.gameFlags.Add("ef8f7eb3bcd7b444f80d5da539f3b133PlayerWeaponData", Tuple.Create("ability_obtain", "Arrow: Thunder Buster", "GameFlagDescriptable") );
  vars.gameFlags.Add("3949bc0edba197d459f5d2d7f15c72e0PlayerWeaponData", Tuple.Create("ability_obtain", "Arrow: Shadow Hunter", "GameFlagDescriptable") );
  vars.gameFlags.Add("5036f58e39fd647a19adba5bf37069a4SkillNodeData", Tuple.Create("ability_obtain", "Transmute Unto Wealth", "GameFlagDescriptable") );
  vars.gameFlags.Add("d311393b203f34bf19e020312946d376SkillNodeData", Tuple.Create("ability_obtain", "Transmute Unto Life", "GameFlagDescriptable") );
  vars.gameFlags.Add("6c03c15409a6244ec92b22d1ed1830c7SkillNodeData", Tuple.Create("ability_obtain", "Transmute Unto Qi", "GameFlagDescriptable") );

  // Ability Rooms 
  vars.gameFlags.Add("d7a7775c-dd94-40af-9a65-bcbc73bcef43_9e73acaa5eb0f4a65bd599ed193c852cScriptableDataBool", Tuple.Create("ability_exit", "Tai Chi Kick Room", "ScriptableDataBool") );
  vars.gameFlags.Add("a791e2f5-4cfb-4be0-a8aa-cb4344ce5784_ee992f5c8f50b4b0caa5ef6c27d19d4dScriptableDataBool", Tuple.Create("ability_exit", "Charged Strike Room", "ScriptableDataBool") );
  vars.gameFlags.Add("fcdd31e0-0772-4907-91e9-e27eac5446fe_6c434469f3b6049638220e464708ceafScriptableDataBool", Tuple.Create("ability_exit", "Air Dash Room", "ScriptableDataBool") );
  vars.gameFlags.Add("8e8f9d2c-8420-4056-8bef-256d981ca747_d9471a64dd55c486bbe604ae326ac961ScriptableDataBool", Tuple.Create("ability_exit", "Unbounded Counter Room", "ScriptableDataBool") );
  vars.gameFlags.Add("8be2b95b-1b1c-443f-80d3-f488ecb52145_3cf7cd9b3e2c840af8ec10763a0c7fceScriptableDataBool", Tuple.Create("ability_exit", "Double Jump Room", "ScriptableDataBool") );
  
  // Sols Seals
  vars.gameFlags.Add("3e29d950db438456f856b339b02af177ItemData", Tuple.Create("seal_obtain", "Kuafu Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("687e430938a164d249d0b3befeb786a3ItemData", Tuple.Create("seal_obtain", "Goumang Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("9391d80ddafa5d74eb3aca1449ed63ecItemData", Tuple.Create("seal_obtain", "Yanlao Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("3596ea85d82e7d9419ee710c50c19655ItemData", Tuple.Create("seal_obtain", "Jiequan Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("f54ffa939efda244f9193ffd5379ee99ScriptableDataBool", Tuple.Create("seal_obtain", "Fake Lady Ethereal Seal", "ScriptableDataBool") );
  vars.gameFlags.Add("7d7086dda1d540f4ab32c919d59ea036ItemData", Tuple.Create("seal_obtain", "Lady Ethereal Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("0218216d41d6441d69da23ea385d9452ItemData", Tuple.Create("seal_obtain", "Ji Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("3f04475e7c59f458a850f1725cf8f197ItemData", Tuple.Create("seal_obtain", "Fuxi Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("cea7218ddb8b449008101c3ccdc8b50bItemData", Tuple.Create("seal_obtain", "Nuwa Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("6146c740-3940-4975-8061-a93726013e17_ab6a52c60b84a4d6fb5a32242f77bad1ScriptableDataBool", Tuple.Create("seal_obtain", "Eigong Soulscape", "ScriptableDataBool") );

  // Key Items
  vars.gameFlags.Add("739f82b064f1d40ff953c4bdf845c5d1ItemData", Tuple.Create("keyitem_obtain", "Crimson Hibiscus", "GameFlagDescriptable") );
  vars.gameFlags.Add("ebc522544cda748f4b2e121041f34752ItemData", Tuple.Create("keyitem_obtain", "Bloody Crimson Hibiscus", "GameFlagDescriptable") );
  vars.gameFlags.Add("012ed640ec72c5e409d85c7e8a6b4436ItemData", Tuple.Create("keyitem_obtain", "Ancient Penglai Ballad", "GameFlagDescriptable") );
  vars.gameFlags.Add("baaef97de0f4c294080224ebb9b1108eItemData", Tuple.Create("keyitem_obtain", "Poem Hidden in the Immortal’s Portrait", "GameFlagDescriptable") );
  vars.gameFlags.Add("8722c67effb3dc844b48c5082ef55b70ItemData", Tuple.Create("keyitem_obtain", "Thunderburst Bomb", "GameFlagDescriptable") );
  vars.gameFlags.Add("3f24b97a10eaa914fbca5cf866b6dcb8ItemData", Tuple.Create("keyitem_obtain", "Homing Darts", "GameFlagDescriptable") );
  vars.gameFlags.Add("b6b928329a5ae114ca7ab0935bb6427cItemData", Tuple.Create("keyitem_obtain", "Soul-Severing Blade", "GameFlagDescriptable") );
  vars.gameFlags.Add("a3dd1abd74d68304687da6ad5ff3fe56ItemData", Tuple.Create("keyitem_obtain", "Firestorm Ring", "GameFlagDescriptable") );
  vars.gameFlags.Add("54fa2de19e7780448b773554d0229750ItemData", Tuple.Create("keyitem_obtain", "Yellow Dragonsnake Venom Sac", "GameFlagDescriptable") );
  vars.gameFlags.Add("80dca009f7f94024b9567c9acc857fd6ItemData", Tuple.Create("keyitem_obtain", "Yellow Dragonsnake Medicinal Brew", "GameFlagDescriptable") );
  vars.gameFlags.Add("ac3f2ead21bde4ef886068840a25a9e6ItemData", Tuple.Create("keyitem_obtain", "Ji’s Hair", "GameFlagDescriptable") );
  vars.gameFlags.Add("16d0ec9928dc24b4cac4830f25e986dcItemData", Tuple.Create("keyitem_obtain", "Tianhuo Serum", "GameFlagDescriptable") );
  vars.gameFlags.Add("4930f5079e3fe4571aeeb640c3563c78ItemData", Tuple.Create("keyitem_obtain", "Elevator Access Token", "GameFlagDescriptable") );
  vars.gameFlags.Add("8b04356645160f24ab172496244c34c2ItemData", Tuple.Create("keyitem_obtain", "Rhizomatic Bomb", "GameFlagDescriptable") );
  vars.gameFlags.Add("40c579b4aaf773b4a9a9078633b1d7fbItemData", Tuple.Create("keyitem_obtain", "Rhizomatic Arrow", "GameFlagDescriptable") );
  vars.gameFlags.Add("e50d7e80053813c4cae82eae265b9326ItemData", Tuple.Create("keyitem_obtain", "Abandoned Mines Access Token", "GameFlagDescriptable") );
  vars.gameFlags.Add("a3960b34a56b2ad4998b5538bef3ce0bItemData", Tuple.Create("keyitem_obtain", "Friend Photo", "GameFlagDescriptable") );

  // Boss Kills
  vars.gameFlags.Add("593da1d0fcfe85e45b43c39ccb2c6d19ScriptableDataBool", Tuple.Create("mainboss_kill", "General: Yingzhao", "ScriptableDataBool") );
  vars.gameFlags.Add("f5b26e3311ce4e84a961dc36a05e19b7ScriptableDataBool", Tuple.Create("mainboss_kill", "Goumang", "ScriptableDataBool") );
  vars.gameFlags.Add("098316c3b4ddf514fbc2dc2806475da2ScriptableDataBool", Tuple.Create("mainboss_kill", "Xingtian", "ScriptableDataBool") );
  vars.gameFlags.Add("fac7bf4a1b1f89d47873e1ec23d1c3c8ScriptableDataBool", Tuple.Create("mainboss_kill", "Yanlao", "ScriptableDataBool") );
  vars.gameFlags.Add("b500f8ebeb10f46a085b9720f5a78affScriptableDataBool", Tuple.Create("mainboss_kill", "Kanghui", "ScriptableDataBool") );
  vars.gameFlags.Add("9758240a82bf8472a884fe3123cd6a2cScriptableDataBool", Tuple.Create("mainboss_kill", "Jiequan", "ScriptableDataBool") );
  vars.gameFlags.Add("6944565dad46a40c2abc1e23f2a43b9eScriptableDataBool", Tuple.Create("mainboss_kill", "Lady Ethereal", "ScriptableDataBool") );
  vars.gameFlags.Add("5f5f478635ac043de8548c4bd01f96d8ScriptableDataBool", Tuple.Create("mainboss_kill", "Ji", "ScriptableDataBool") );
  vars.gameFlags.Add("515275bbda5bb4e22ba6734765b9d5f0ScriptableDataBool", Tuple.Create("mainboss_kill", "The Fengs", "ScriptableDataBool") );
  vars.gameFlags.Add("b3697303-e24c-4b74-bd77-878405db5956_096fc6e6545b944499588940b495a7c9ScriptableDataBool", Tuple.Create("mainboss_kill", "Xingtian 2", "ScriptableDataBool") );
  vars.gameFlags.Add("e965aab1c014b4273b928b17fbcff379ScriptableDataBool", Tuple.Create("mainboss_kill", "Eigong", "ScriptableDataBool") );

  vars.gameFlags.Add("740a8b30-e3cc-4acc-9f5f-da3aaae1df5e_51c211e21fecd9e4c92f41d8d72aa395ScriptableDataBool", Tuple.Create("miniboss_kill", "Red Tiger Elite: Baichang", "ScriptableDataBool") );
  vars.gameFlags.Add("f02edcb5-d9e9-4d82-8720-f1edc3ad2584_bdb107bda9026404c998ac905b5c7c4cScriptableDataBool", Tuple.Create("miniboss_kill", "Red Tiger Elite: Kuiyan", "ScriptableDataBool") );
  vars.gameFlags.Add("9fe14cb5-dbbe-4475-815e-6d10a3154d71_cb3bbfb9ba35a544984803710f5abefaScriptableDataBool", Tuple.Create("miniboss_kill", "Red Tiger Elite: Yanren", "ScriptableDataBool") );
  vars.gameFlags.Add("b02ac84c63b804448b50c45c7f19ebb8ScriptableDataBool", Tuple.Create("miniboss_kill", "Red Tiger Elite: Lieguan", "ScriptableDataBool") );
  vars.gameFlags.Add("2798b3a9-1026-4d53-b41c-5489699a19de_c3c3f30fb046d9743aea48eb8f4833bcScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Sentinel: Jiaoduan", "ScriptableDataBool") );
  vars.gameFlags.Add("d439daf8-aaa0-4427-b5fe-5b55059ec748_c83c9231040ca21409a717047a99f127ScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Sentinel: Wuqiang", "ScriptableDataBool") );
  vars.gameFlags.Add("79982da1-b0c0-4a3e-b53f-cea5ebdb2afa_efdc8e91e5eb76347b87b832ac07330cScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Spectre: Shuigui", "ScriptableDataBool") );
  vars.gameFlags.Add("558ba1a9-0f3c-47cb-835c-e1a969ba0ec2_19ef97be8cb7b4fca9d79b754bb6c81cScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Spectre: Shangui", "ScriptableDataBool") );
  vars.gameFlags.Add("27a85ba1-abe8-4a23-b07b-4eb558b6dd35_286e6acc5d4484caa93380d46d08e162ScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Enforcer: Tieyan", "ScriptableDataBool") );
  vars.gameFlags.Add("bc5ca55c-065c-4ad8-9f18-bbc7ab2e468a_11c84f9bfd4e1445395ec443308d3965ScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Enforcer: Huanxian", "ScriptableDataBool") );
  vars.gameFlags.Add("b3c981ef-5094-4bc7-804c-60b9f3d75f56_104b8d0cf618434478e9e75ae3ee9d88ScriptableDataBool", Tuple.Create("miniboss_kill", "Celestial Warden: Yinyue", "ScriptableDataBool") );
  vars.gameFlags.Add("50926aad-0750-4f3b-9318-dc5da45e75f1_4256ef2ec22f942dc9f70607bb00391fScriptableDataBool", Tuple.Create("miniboss_kill", "The Great Miner: Tianshou", "ScriptableDataBool") );
  vars.gameFlags.Add("eb5c407de5f18ae478f86b4287bcd600ScriptableDataBool", Tuple.Create("miniboss_kill", "Spirit Keeper: Cixing", "ScriptableDataBool") );
  
  // Jades
  vars.gameFlags.Add("7e33977082bec4db5ab349143f89c24fJadeData", Tuple.Create("jade_obtain", "Qi Thief Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("b8fd8e42229824b788bc222b837382f2JadeData", Tuple.Create("jade_obtain", "Immovable Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("a0a2cb6d037ee4d80a74fd447a21682eJadeData", Tuple.Create("jade_obtain", "Harness Force Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("36eb7e7b95e91467191b8f24dbbb5a3eJadeData", Tuple.Create("jade_obtain", "Focus Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1e635338961c24feb93798c36c07f128JadeData", Tuple.Create("jade_obtain", "Swift Descent Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("8417398823dca444b924aa9e49e82385JadeData", Tuple.Create("jade_obtain", "Medical Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("316728bf6fa814c8085a4ce094c6cabbJadeData", Tuple.Create("jade_obtain", "Quick Dose Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("28837290da6d24917ad6c99213d99d3dJadeData", Tuple.Create("jade_obtain", "Steely Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1e983ace0eb874a3a883c5f1f50e2926JadeData", Tuple.Create("jade_obtain", "Stasis Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("45a17198c6bff4c42989f3e2d9cb583bJadeData", Tuple.Create("jade_obtain", "Mob Quell Jade - Yin", "GameFlagDescriptable") );
  vars.gameFlags.Add("8ff52186b5d2849f6930bd5bf5d86b8aJadeData", Tuple.Create("jade_obtain", "Mob Quell Jade - Yang", "GameFlagDescriptable") );
  vars.gameFlags.Add("fce2186e0ae684bde9548905d5ed5533JadeData", Tuple.Create("jade_obtain", "Bearing Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("ef792d1867d1a4a9c8ec6cd721ee5cb3JadeData", Tuple.Create("jade_obtain", "Divine Hand Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("ff5f58b8404514c11b7ec4166b294349JadeData", Tuple.Create("jade_obtain", "Iron Skin Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("562375e7a68ec42b28f3bdd5f45d7b72JadeData", Tuple.Create("jade_obtain", "Pauper Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("b4c7da472cfba425ba5d0b0309dc4f17JadeData", Tuple.Create("jade_obtain", "Swift Blade Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3411e0d523aec41f9be4e24ff81b6293JadeData", Tuple.Create("jade_obtain", "Last Stand Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("e6f162e19282346db96145ee80b5ccc1JadeData", Tuple.Create("jade_obtain", "Recovery Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3ddbef7a7a579497b82fe3712177c089JadeData", Tuple.Create("jade_obtain", "Breather Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3c8fd0425b80a405a8fb9623094fcafcJadeData", Tuple.Create("jade_obtain", "Hedgehog Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("dbda764ac569f4d6b871fb6c82f11adeJadeData", Tuple.Create("jade_obtain", "Ricochet Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("987349e8a21844d28a86853bb0e5de09JadeData", Tuple.Create("jade_obtain", "Revival Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("468a3373787c2443794e57f101b5f794JadeData", Tuple.Create("jade_obtain", "Soul Reaper Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1796f5882076b4c7c859bc4b0747d8bbJadeData", Tuple.Create("jade_obtain", "Health Thief Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("dfa6bbf26dfef4032a5287a7d9b27881JadeData", Tuple.Create("jade_obtain", "Qi Blade Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("111a1eb49b6d0476488eba696f991e19JadeData", Tuple.Create("jade_obtain", "Qi Swipe Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("589b90f2463944b95aeb6821385b3be6JadeData", Tuple.Create("jade_obtain", "Reciprocation Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("cfcd9f0d330344e628e7d8742955c172JadeData", Tuple.Create("jade_obtain", "Cultivation Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("88263fdff21bc8b4da3977c47ab02f03JadeData", Tuple.Create("jade_obtain", "Avarice Jade", "GameFlagDescriptable") );
  
  // Artifacts
  vars.gameFlags.Add("c06500f5667730141aee0f2f2e470ad0ItemData", Tuple.Create("artifact_obtain", "Fusang Amulet", "GameFlagDescriptable") );
  vars.gameFlags.Add("e143133559a42004ba225b6273ccf6d9ItemData", Tuple.Create("artifact_obtain", "Multi-tool Kit", "GameFlagDescriptable") );
  vars.gameFlags.Add("8f81aaa43927b41448a502145949a2b0ItemData", Tuple.Create("artifact_obtain", "Tiandao Academy Periodical", "GameFlagDescriptable") );
  vars.gameFlags.Add("833cf6d005f2a4b7cab231aecb5f23aeItemData", Tuple.Create("artifact_obtain", "Kunlun Immortal Portrait", "GameFlagDescriptable") );
  vars.gameFlags.Add("35dd82067571f4a4099df6a4fdbf7322ItemData", Tuple.Create("artifact_obtain", "Qiankun Board", "GameFlagDescriptable") );
  vars.gameFlags.Add("f688c32090bd9a447b2caa202e5d2537ItemData", Tuple.Create("artifact_obtain", "Ancient Sheet Music", "GameFlagDescriptable") );
  vars.gameFlags.Add("8d0f6ac6661d7ca4ab6c9a38b59e8044ItemData", Tuple.Create("artifact_obtain", "Unknown Seed", "GameFlagDescriptable") );
  vars.gameFlags.Add("0a5ecab971d381a4dad39e8bf488874dItemData", Tuple.Create("artifact_obtain", "Virtual Reality Device", "GameFlagDescriptable") );
  vars.gameFlags.Add("b9574a152b739c147a0ecc84a26bbb51ItemData", Tuple.Create("artifact_obtain", "Antique Vinyl Record", "GameFlagDescriptable") );
  vars.gameFlags.Add("cd77f022f99dce04ebc1af78be7b9b50ItemData", Tuple.Create("artifact_obtain", "Ready-to-Eat Rations", "GameFlagDescriptable") );
  vars.gameFlags.Add("e481e2d53769c64469b962d736eea9c3ItemData", Tuple.Create("artifact_obtain", "Sword of Jie", "GameFlagDescriptable") );
  vars.gameFlags.Add("f64e42e463e6c47da8eefe978273b154ItemData", Tuple.Create("artifact_obtain", "Red Guifang Clay", "GameFlagDescriptable") );
  vars.gameFlags.Add("281fc49002e760e47af668e87f3cbf82ItemData", Tuple.Create("artifact_obtain", "The Four Treasures of the Study", "GameFlagDescriptable") );
  vars.gameFlags.Add("f9035fc8724f2224f9b4e1949459eda4ItemData", Tuple.Create("artifact_obtain", "Penglai Recipe Collection", "GameFlagDescriptable") );
  vars.gameFlags.Add("b76de9e39b92a3642aaea5ef8280265fItemData", Tuple.Create("artifact_obtain", "Damaged Fusang Amulet", "GameFlagDescriptable") );
  vars.gameFlags.Add("0c76757489a7fa542b4351efc4731a49ItemData", Tuple.Create("artifact_obtain", "The Legend of the Porky Heroes", "GameFlagDescriptable") );
  vars.gameFlags.Add("c50645a6658fe4b429ea575c35c28ba3ItemData", Tuple.Create("artifact_obtain", "Portrait of Yi", "GameFlagDescriptable") );
  vars.gameFlags.Add("ca5aaa95-152f-4234-907e-1ecf2fb44ca8_3ab980947561e27459c2316b2a59889bScriptableDataBool", Tuple.Create("artifact_obtain", "GM Fertilizer (Factory)", "ScriptableDataBool") );
  vars.gameFlags.Add("3b54e07d-ef21-4316-979c-9dfc3462df9c_92a5cecaeb73b428fa0e2b6990d4fb1bScriptableDataBool", Tuple.Create("artifact_obtain", "GM Fertilizer (Sky Tower)", "ScriptableDataBool") );
  
  // Poisons
  vars.gameFlags.Add("c753eb7cbd4ae7048a0dcc715b23e6f0ItemData", Tuple.Create("poison_obtain", "Medicinal Citrine", "GameFlagDescriptable") );
  vars.gameFlags.Add("c40e455c58fa8e444aa5c8657de9143eItemData", Tuple.Create("poison_obtain", "Golden Yinglong Egg", "GameFlagDescriptable") );
  vars.gameFlags.Add("96d11b4a9a625ab488ca42e489787eeaItemData", Tuple.Create("poison_obtain", "Molted Tianma Hide", "GameFlagDescriptable") );
  vars.gameFlags.Add("e0c92cd8e9370e74c97d5ae797cabce6ItemData", Tuple.Create("poison_obtain", "Residual Hair", "GameFlagDescriptable") );
  vars.gameFlags.Add("66a914e6e380d464e94f6c56734179c4ItemData", Tuple.Create("poison_obtain", "Oriander", "GameFlagDescriptable") );
  vars.gameFlags.Add("2d7ce5740746b504d8ad8caebc1e4686ItemData", Tuple.Create("poison_obtain", "Turtle Scorpion", "GameFlagDescriptable") );
  vars.gameFlags.Add("ed5ec481e3a08344fa779713d791e8b7ItemData", Tuple.Create("poison_obtain", "Plantago Frog", "GameFlagDescriptable") );
  vars.gameFlags.Add("2a761d75584603d418c3a63762ce215cItemData", Tuple.Create("poison_obtain", "Porcine Gem", "GameFlagDescriptable") );
  vars.gameFlags.Add("4db95fe8859303b498f08e2290f5b6b9ItemData", Tuple.Create("poison_obtain", "Ball of Flavor", "GameFlagDescriptable") );
  vars.gameFlags.Add("cef71c68e23677d4aae949c4999dae2bItemData", Tuple.Create("poison_obtain", "Dragon's Whip", "GameFlagDescriptable") );
  vars.gameFlags.Add("3623910f44ed1d04fab5face0b376359ItemData", Tuple.Create("poison_obtain", "Necroceps", "GameFlagDescriptable") );
  vars.gameFlags.Add("3cb140e76363b774292297d90bc76d0eItemData", Tuple.Create("poison_obtain", "Guiseng", "GameFlagDescriptable") );
  vars.gameFlags.Add("4bb79b0a891845542848960ddfd0a03cItemData", Tuple.Create("poison_obtain", "Thunder Centipede", "GameFlagDescriptable") );
  vars.gameFlags.Add("00b0232c825990a45a3aad8212dff74eItemData", Tuple.Create("poison_obtain", "Wall-climbing Gecko", "GameFlagDescriptable") );
  vars.gameFlags.Add("2203778119e9b0540a493e3d4981d5e2ItemData", Tuple.Create("poison_obtain", "Gutwrench Fruit", "GameFlagDescriptable") );

  // Map Chips
  vars.gameFlags.Add("ea9a496b025d3495c9dc2ef974fdc092ItemData", Tuple.Create("mapchip_obtain", "Power Reservoir Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("dbde23882967941729f72898668d888eItemData", Tuple.Create("mapchip_obtain", "Agricultural Zone Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("1f04b20cba6dd44edb862ed7cac7c8c3ItemData", Tuple.Create("mapchip_obtain", "Warehouse Zone Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("62c8e43f21bdb4629816759f012f2dc4ItemData", Tuple.Create("mapchip_obtain", "Transmutation Zone Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("44eb40430cc294dcba56f740fc539336ItemData", Tuple.Create("mapchip_obtain", "Abandoned Mines Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("cc2161127ffac40f3900b2338732539cItemData", Tuple.Create("mapchip_obtain", "Central Core Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("81fd8581688cd4b16947568280181a3eItemData", Tuple.Create("mapchip_obtain", "Empyrean District Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("15afe59971f8d4ba2ba254aa63fbcccdItemData", Tuple.Create("mapchip_obtain", "Grotto of Scriptures Chip", "GameFlagDescriptable") );
  vars.gameFlags.Add("8cadca0dd118b433996ceff3b40c65f1ItemData", Tuple.Create("mapchip_obtain", "Research Institute Chip", "GameFlagDescriptable") );
  
  // Recyclables
  vars.gameFlags.Add("6be26d51d342d73418ba832be13bc58eItemData", Tuple.Create("recyclable_obtain", "Noble Ring", "GameFlagDescriptable") );
  vars.gameFlags.Add("c4a79371b6ba3ce47bbdda684236f7b5ItemData", Tuple.Create("recyclable_obtain", "Gene Eradicator", "GameFlagDescriptable") );
  vars.gameFlags.Add("26ee16f6dab31d544aa70ab3ccd74c27ItemData", Tuple.Create("recyclable_obtain", "Shuanshuan Coin", "GameFlagDescriptable") );
  vars.gameFlags.Add("984057d55ad9a114b8f70d789f51a94aItemData", Tuple.Create("recyclable_obtain", "Jin Medallion", "GameFlagDescriptable") );
  vars.gameFlags.Add("7f39eb3683ab07642b07a29c92f2b2eeItemData", Tuple.Create("recyclable_obtain", "Passenger Token: A-Shou", "GameFlagDescriptable") );
  vars.gameFlags.Add("795a70bd2b1f7314ab17f5a5cf5266acItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Zouyan", "GameFlagDescriptable") );
  vars.gameFlags.Add("9e4262f433d0f71488554605fd049696ItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Xipu", "GameFlagDescriptable") );
  vars.gameFlags.Add("fe61f446873eb224bbf1f579e422bd7aItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Jihai", "GameFlagDescriptable") );
  vars.gameFlags.Add("8f37452c73abd62439d7b19bb04704ceItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Yangfan", "GameFlagDescriptable") );
  vars.gameFlags.Add("1b325062bb8a12f4d9f011b2ae560718ItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Aimu", "GameFlagDescriptable") );
  vars.gameFlags.Add("e235b00504a9145ed81edf6c2a2e0091ItemData", Tuple.Create("recyclable_obtain", "Passenger Token: Shiyangyue", "GameFlagDescriptable") );

  // Tao Fruits
  vars.gameFlags.Add("5dca2439-7a4c-4e9e-9e66-a0282319627b_a1bc70e2b281c4edba29a867c61f2fb1ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Galactic Dock", "ScriptableDataBool") );
  vars.gameFlags.Add("1d9a273a-d817-4734-b0ae-8effef275a71_19ef97be8cb7b4fca9d79b754bb6c81cScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Apeman Facility (Depths)", "ScriptableDataBool") );
  vars.gameFlags.Add("37adc43b-6e63-4f05-8641-7fa1e034a9ac_7592523794a14b241bbd479bdd35d2f3ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Power Reservoir (West)", "ScriptableDataBool") );
  vars.gameFlags.Add("994df5a4-716f-4a08-9730-161c9162fce2_3f513b824c96d4571937497e4cbbe5acScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Water & Oxygen", "ScriptableDataBool") );
  vars.gameFlags.Add("e08b2605-4d1f-4a4e-b864-8a105f7af52b_286e6acc5d4484caa93380d46d08e162ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Inner Warehouse", "ScriptableDataBool") );
  vars.gameFlags.Add("6eef7fd0-7feb-493f-80ab-849699cc874b_6a7e9701c4ef0487683e312ec59d4d60ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Great Hall", "ScriptableDataBool") );
  vars.gameFlags.Add("37393fc2-f05b-4c94-8bb2-1e3f81e64ff8_3ab980947561e27459c2316b2a59889bScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Great Hall (Herb Room)", "ScriptableDataBool") );
  vars.gameFlags.Add("b70de28f-4097-406c-8cf8-583870dc4ab5_104b8d0cf618434478e9e75ae3ee9d88ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Abandoned Mines", "ScriptableDataBool") );
  vars.gameFlags.Add("97d45562-89e6-463d-8740-4d1e012cfd18_92a5cecaeb73b428fa0e2b6990d4fb1bScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Sky Tower", "ScriptableDataBool") );
  vars.gameFlags.Add("e08b2605-4d1f-4a4e-b864-8a105f7af52b_348738fb5673845a6aa8b023a95252cfScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Empyrean (Living Area)", "ScriptableDataBool") );
  vars.gameFlags.Add("5e282a99-9049-4628-9eac-3d5820c72bcd_115aaa87e66aa794a98737572d1454c5ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Lear's Tomb 1", "ScriptableDataBool") );
  vars.gameFlags.Add("7531bdad-dc7e-47db-a640-386674f940dd_115aaa87e66aa794a98737572d1454c5ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Lear's Tomb 2", "ScriptableDataBool") );
  vars.gameFlags.Add("951a38fc-8260-4803-89ba-b8b7affd96c4_115aaa87e66aa794a98737572d1454c5ScriptableDataBool", Tuple.Create("taofruit_obtain", "Tao Fruit - Lear's Tomb 3", "ScriptableDataBool") );

  vars.gameFlags.Add("37adc43b-6e63-4f05-8641-7fa1e034a9ac_c6768859162eb40abaffe7d2dfb703f4ScriptableDataBool", Tuple.Create("taofruit_obtain", "Greater Tao Fruit - Machine Room", "ScriptableDataBool") );
  vars.gameFlags.Add("18a7e188-ce20-495f-8ff9-49b2b0a78515_caffe6beb70444888bda9f21182c38a2ScriptableDataBool", Tuple.Create("taofruit_obtain", "Greater Tao Fruit - Yanlao", "ScriptableDataBool") );
  vars.gameFlags.Add("42e16c3d-e649-417c-909f-400422f8418b_f35dcb18f667441e18541169edcebb1fScriptableDataBool", Tuple.Create("taofruit_obtain", "Greater Tao Fruit - Jiequan", "ScriptableDataBool") );
  vars.gameFlags.Add("b70de28f-4097-406c-8cf8-583870dc4ab5_d5d14d9cbe2ff4247b9d7d1b58ae339bScriptableDataBool", Tuple.Create("taofruit_obtain", "Greater Tao Fruit - Lady Ethereal", "ScriptableDataBool") );
  vars.gameFlags.Add("7212c72d-ce6c-4b5f-a536-4ec7a4e2934e_89b9e9ea7db2e4c118c7e8f1be3e7cf4ScriptableDataBool", Tuple.Create("taofruit_obtain", "Twin Tao Fruit", "ScriptableDataBool") );

  // Dark Steel
  vars.gameFlags.Add("c96e76d4-c946-454f-a8b0-4db846a5ced9_418debbb704b98748ae65f7fe6ccdc3cScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Central Transport Hub", "ScriptableDataBool") );
  vars.gameFlags.Add("111b64cc-23fd-4b0d-b1df-f2893008b0b1_33549742cdf577a49aee4fd4feb91968ScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Boundless Repository", "ScriptableDataBool") );
  vars.gameFlags.Add("8cc70dad-1c5d-45ab-b37a-c3ad3bc769f4_f7ef6a27206464d5ab379fbbc19ca08eScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Peach Blossom Village", "ScriptableDataBool") );
  vars.gameFlags.Add("8b8ca1b2-39db-4850-94a2-15c35b2ddba2_4256ef2ec22f942dc9f70607bb00391fScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Empyrean District (Passages)", "ScriptableDataBool") );
  vars.gameFlags.Add("07f3b10d-9898-4ca5-95ad-db4eb15cc565_b598ff87936dd4704b091233b5316a00ScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Grotto of Scriptures (Entry)", "ScriptableDataBool") );
  vars.gameFlags.Add("d96cac9f-6975-4a5e-b573-f81d50c89407_fca3e578a1b174fc0bc7177e8c1ba3faScriptableDataBool", Tuple.Create("darksteel_obtain", "Dark Steel - Tiandao Research Center", "ScriptableDataBool") );
  
  // Bow Upgrades
  vars.gameFlags.Add("faf6ea3275280401784f347f98bb6fecMerchandiseData", Tuple.Create("bowupgrade_obtain", "Azure Sand 1", "MerchandiseData") );
  vars.gameFlags.Add("7318aa07da4844119a650c3f2d50e486MerchandiseData", Tuple.Create("bowupgrade_obtain", "Azure Sand 2", "MerchandiseData") );
  vars.gameFlags.Add("177153ae6304f4b679710ba5a04ee73aMerchandiseData", Tuple.Create("bowupgrade_obtain", "Azure Sand 3", "MerchandiseData") );
  vars.gameFlags.Add("6739393f679d15e499d5431d9dffbb90MerchandiseData", Tuple.Create("bowupgrade_obtain", "Cloud Piercer S", "MerchandiseData") );
  vars.gameFlags.Add("83f988d88c5d5364192bdfcc23be4153MerchandiseData", Tuple.Create("bowupgrade_obtain", "Cloud Piercer X", "MerchandiseData") );
  vars.gameFlags.Add("11c0763bddad6b344a1c35a1383beb78MerchandiseData", Tuple.Create("bowupgrade_obtain", "Thunder Buster S", "MerchandiseData") );
  vars.gameFlags.Add("228a5782203c00f4584aada7b014bbd4MerchandiseData", Tuple.Create("bowupgrade_obtain", "Thunder Buster X", "MerchandiseData") );
  vars.gameFlags.Add("45161198c2e944449a181d0a656b54edMerchandiseData", Tuple.Create("bowupgrade_obtain", "Shadow Hunter S", "MerchandiseData") );
  vars.gameFlags.Add("d96112e1b741ec04ca845e028101feafMerchandiseData", Tuple.Create("bowupgrade_obtain", "Shadow Hunter X", "MerchandiseData") );

  // Computing Unit
  vars.gameFlags.Add("d2b3e894-4292-4efe-a627-f8c7e38d4891_8aeaa90a7d08d4fc3a5c59630fe9716cScriptableDataBool", Tuple.Create("computingunit_obtain", "Computing Unit - Four Seasons Pavilion", "ScriptableDataBool") );
  vars.gameFlags.Add("f37a555f-9c4e-49ad-a9bd-14ccb57a87b7_c3c3f30fb046d9743aea48eb8f4833bcScriptableDataBool", Tuple.Create("computingunit_obtain", "Computing Unit - Power Reservoir (East)", "ScriptableDataBool") );
  vars.gameFlags.Add("1ff756a9-e127-4e4d-984c-ae935ab7dfbd_18fd0ad3eb6b7416fa8fe27b79ec39c9ScriptableDataBool", Tuple.Create("computingunit_obtain", "Computing Unit - Empyrean District (Sanctum)", "ScriptableDataBool") );
  vars.gameFlags.Add("9225907a-d6dd-43fc-83ab-73eb2349ea2e_d7288778de58e4b499992c97e2824bc0ScriptableDataBool", Tuple.Create("computingunit_obtain", "Computing Unit - Grotto of Scriptures (West)", "ScriptableDataBool") );
  vars.gameFlags.Add("e7bb288a8b918054abe9edd7c314c7faMerchandiseData", Tuple.Create("computingunit_obtain", "Computing Unit - Chiyou 1", "MerchandiseData") );
  vars.gameFlags.Add("cd12b658c686e8b41b00717202716715MerchandiseData", Tuple.Create("computingunit_obtain", "Computing Unit - Chiyou 2", "MerchandiseData") );
  vars.gameFlags.Add("67004289e911d6f489c8c7eef283be74MerchandiseData", Tuple.Create("computingunit_obtain", "Computing Unit - Chiyou 3", "MerchandiseData") );
  vars.gameFlags.Add("6439edc34fb0b484fb1cd6ac7de463f3MerchandiseData", Tuple.Create("computingunit_obtain", "Computing Unit - Chiyou 4", "MerchandiseData") );

  // Pipe Vials
  vars.gameFlags.Add("cb06d39a-44bb-4eed-9880-d00f7e4498bd_48d93add041e85048bc0d4331ff01727ScriptableDataBool", Tuple.Create("pipevial_obtain", "Pipe Vial - New Kunlun Central Hall", "ScriptableDataBool") );
  vars.gameFlags.Add("2a9ba109-3700-4e08-95a5-4226e91e01e4_924b939d4c061b84e9e2482fbc4dd936ScriptableDataBool", Tuple.Create("pipevial_obtain", "Pipe Vial - Lake Yaochi Ruins", "ScriptableDataBool") );
  vars.gameFlags.Add("5432620e751c4504f857c68bdf433c5fMerchandiseData", Tuple.Create("pipevial_obtain", "Pipe Vial - 3D Printer 1", "MerchandiseData") );
  vars.gameFlags.Add("5a2fb49c5eabd754ea3499cf6c898685MerchandiseData", Tuple.Create("pipevial_obtain", "Pipe Vial - 3D Printer 2", "MerchandiseData") );
  vars.gameFlags.Add("3555a119fbd577343bbbe9f117ba431eMerchandiseData", Tuple.Create("pipevial_obtain", "Pipe Vial - 3D Printer 3", "MerchandiseData") );
  vars.gameFlags.Add("03d2eba01b313e14ea7980db97e2c876MerchandiseData", Tuple.Create("pipevial_obtain", "Pipe Vial - 3D Printer 4", "MerchandiseData") );

  // Herb Catalyst
  vars.gameFlags.Add("7637cf70-7b5f-430b-bd2f-eea133a5c780_34ebd07e21b942d408d976e0234bef26ScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Radiant Pagoda)", "ScriptableDataBool") );
  vars.gameFlags.Add("b6d0b6bc-15c5-4945-9471-fec6c473edd3_3f513b824c96d4571937497e4cbbe5acScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Water & Oxygen Synthesis)", "ScriptableDataBool") );
  vars.gameFlags.Add("ed76b409-ea0c-40ca-b7cf-9902da09c6a4_19ef97be8cb7b4fca9d79b754bb6c81cScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Apeman Facility (Depths))", "ScriptableDataBool") );
  vars.gameFlags.Add("39bc402c-d3ba-467a-89eb-e8ca0d60d18d_286e6acc5d4484caa93380d46d08e162ScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Inner Warehouse", "ScriptableDataBool") );
  vars.gameFlags.Add("4d19d7f5-0f37-44d3-bb5c-7c73425083c0_c6768859162eb40abaffe7d2dfb703f4ScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Factory (Machine Room)", "ScriptableDataBool") );
  vars.gameFlags.Add("698409a7-a500-49f4-80db-b7338a50eb70_104b8d0cf618434478e9e75ae3ee9d88ScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Abandoned Mines", "ScriptableDataBool") );
  vars.gameFlags.Add("af0efbc3-1c92-42cb-a76c-5351ea54d7ff_4256ef2ec22f942dc9f70607bb00391fScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Empyrean District (Passages)", "ScriptableDataBool") );
  vars.gameFlags.Add("39bc402c-d3ba-467a-89eb-e8ca0d60d18d_51e5841c83cf44019b62eed666957473ScriptableDataBool", Tuple.Create("herbcatalyst_obtain", "Herb Catalyst - Grotto of Scriptures (East)", "ScriptableDataBool") );

  // Pipe Upgrades
  vars.gameFlags.Add("9ccb3d7d00f293041980e1e4d33c06e4MerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 1", "MerchandiseData") );
  vars.gameFlags.Add("9b963c922b84fc74596a94d810e2d60dMerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 2", "MerchandiseData") );
  vars.gameFlags.Add("33d4d47ddd5d37f40973741e0301bec2MerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 3", "MerchandiseData") );
  vars.gameFlags.Add("3dfda9c3eeb1d774da8f3ae5be10451cMerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 4", "MerchandiseData") );3
  vars.gameFlags.Add("47335b6af1613b9468b9ad7043f0285dMerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 5", "MerchandiseData") );
  vars.gameFlags.Add("b25b8174d0480844da649da6beb6e698MerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 6", "MerchandiseData") );
  vars.gameFlags.Add("cc143dc7303dd2a4caabdb5a1db035f5MerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 7", "MerchandiseData") );
  vars.gameFlags.Add("ddb72c79080ae9f46bd52994358c2d1cMerchandiseData", Tuple.Create("pipeupgrade_obtain", "Pipe Upgrade 8", "MerchandiseData") );

  // Root Nodes
  vars.gameFlags.Add("3f4604f810c9e9a469f01d352d8035b9TeleportPointData", Tuple.Create("rootnode_unlock", "Galactic Dock", "GameFlagDescriptable") );
  vars.gameFlags.Add("b3cf5264bd5d54b06975638acac58b2aTeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Monitoring)", "GameFlagDescriptable") );
  vars.gameFlags.Add("113385c61a2544446925e7516fea6016TeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Elevator) 1", "GameFlagDescriptable") );
  vars.gameFlags.Add("2ee85cc763a3d413f9b6e18e7e1fee67TeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Elevator) 2", "GameFlagDescriptable") );
  vars.gameFlags.Add("b9e8a5c6d9f6e4812bf9cc30810faadbTeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Depths)", "GameFlagDescriptable") );
  vars.gameFlags.Add("9bf82941e7038a44980ca867c751e5cbTeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (Central)", "GameFlagDescriptable") );
  vars.gameFlags.Add("610a3a3232701af47b876a660910fccaTeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (East)", "GameFlagDescriptable") );
  vars.gameFlags.Add("a71b5769629d443ef9af5e3a05385c73TeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (West)", "GameFlagDescriptable") );
  vars.gameFlags.Add("b3310817230814fa09f5fa3b12cb6293TeleportPointData", Tuple.Create("rootnode_unlock", "Radiant Pagoda", "GameFlagDescriptable") );
  vars.gameFlags.Add("e5246ef15ff2a41ae884071b014351f4TeleportPointData", Tuple.Create("rootnode_unlock", "Central Transport Hub", "GameFlagDescriptable") );
  vars.gameFlags.Add("07215bbc4dc4247aeb7a980bf4910bf9TeleportPointData", Tuple.Create("rootnode_unlock", "Lake Yaochi Ruins", "GameFlagDescriptable") );
  vars.gameFlags.Add("126a7caa6701e4f0a9059b603a309c3fTeleportPointData", Tuple.Create("rootnode_unlock", "Greenhouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("b242c961367ad6a49889999af22a46d9TeleportPointData", Tuple.Create("rootnode_unlock", "Water & Oxygen Synthesis", "GameFlagDescriptable") );
  vars.gameFlags.Add("1025e9e6b5d9440979328bcc29d89468TeleportPointData", Tuple.Create("rootnode_unlock", "Agrarian Hall", "GameFlagDescriptable") );
  vars.gameFlags.Add("685eb4dc303abbd43a67a07cf0459c64TeleportPointData", Tuple.Create("rootnode_unlock", "Yinglong Canal", "GameFlagDescriptable") );
  vars.gameFlags.Add("afbe61da78699487faccd6f0ae1d9667TeleportPointData", Tuple.Create("rootnode_unlock", "Outer Warehouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("2c8de8a9dfacf4f65a0fa1e60a16f852TeleportPointData", Tuple.Create("rootnode_unlock", "Inner Warehouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("242132789f3c9e94bbabb096bad651a5TeleportPointData", Tuple.Create("rootnode_unlock", "Boundless Repository", "GameFlagDescriptable") );
  vars.gameFlags.Add("c748d8c36b73c464fa38d9b156c0b0bcTeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Great Hall)", "GameFlagDescriptable") );
  vars.gameFlags.Add("28a1908d9e21d4136b8c903e2b92b0afTeleportPointData", Tuple.Create("rootnode_unlock", "Prison", "GameFlagDescriptable") );
  vars.gameFlags.Add("4970d157835c54adbb55bb4f8e245fdfTeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Machine Room)", "GameFlagDescriptable") );
  vars.gameFlags.Add("7a581656cd08345b793d7ad2b14e9943TeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Production Area)", "GameFlagDescriptable") );
  vars.gameFlags.Add("7b8d46b0c0c1845fe893ce18aa67bca3TeleportPointData", Tuple.Create("rootnode_unlock", "Shengwu Hall", "GameFlagDescriptable") );
  vars.gameFlags.Add("f1e11be280022400caf9c8593ead7d43TeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Underground)", "GameFlagDescriptable") );
  vars.gameFlags.Add("3b7b8da692cb64d298142612c02daa4cTeleportPointData", Tuple.Create("rootnode_unlock", "Abandoned Mines", "GameFlagDescriptable") );
  vars.gameFlags.Add("c971454704bfa480880660b06e4af2c7TeleportPointData", Tuple.Create("rootnode_unlock", "Cortex Center", "GameFlagDescriptable") );
  vars.gameFlags.Add("8e915ab1790ef69468d4d49d4f338db2TeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Passages)", "GameFlagDescriptable") );
  vars.gameFlags.Add("1a4e7bc2545139145ba229dac285581bTeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Living Area)", "GameFlagDescriptable") );
  vars.gameFlags.Add("ba5ec4c4a702ba84baec1326a803b2b6TeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Sanctum)", "GameFlagDescriptable") );
  vars.gameFlags.Add("32bafafe1cacf5c49af2f7c9e45fe511TeleportPointData", Tuple.Create("rootnode_unlock", "Sky Tower", "GameFlagDescriptable") );
  vars.gameFlags.Add("4bb93fbefaedb8e47949d1d384220c21TeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (Entry)", "GameFlagDescriptable") );
  vars.gameFlags.Add("1b81567d30abe194d845d3f08beae8fdTeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (East)", "GameFlagDescriptable") );
  vars.gameFlags.Add("fbaf57e3f6bea904ea8c150e5915bcf4TeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (West)", "GameFlagDescriptable") );
  vars.gameFlags.Add("5c30ad493bbdebc40a2370664d46b830TeleportPointData", Tuple.Create("rootnode_unlock", "Tiandao Research Center", "GameFlagDescriptable") );
  vars.gameFlags.Add("473d9c581cd574f62a36519ae3d451ebTeleportPointData", Tuple.Create("rootnode_unlock", "Tianhuo Research Institute", "GameFlagDescriptable") );
  vars.gameFlags.Add("da6613d2c8f7e4eb6ae1b4d0fe7fee93TeleportPointData", Tuple.Create("rootnode_unlock", "New Kunlun Control Hub", "GameFlagDescriptable") );

  // Map Unlock:  Apeman Facility
  vars.gameFlags.Add("8f7933bdb493346fbabe65c6f29c76b6GameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Monitoring)", "GameLevelMapData") );
  vars.gameFlags.Add("7ca1bdfe0f0ba4252b922f03a614cd29GameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Elevator)", "GameLevelMapData") );
  vars.gameFlags.Add("b0ef27248fa9b5449ae2652773568edaGameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Depths)", "GameLevelMapData") );

  // Map Unlock:  New Kunlun Hub
  vars.gameFlags.Add("28cc855e19c274a9b838cfa9a73868feGameLevelMapData", Tuple.Create("map_unlock_hub", "New Kunlun Central Hall", "GameLevelMapData") );
  vars.gameFlags.Add("1d24fc87063235c40b83b837dcab39a5GameLevelMapData", Tuple.Create("map_unlock_hub", "Four Seasons Pavilion", "GameLevelMapData") );
  vars.gameFlags.Add("88a9cc79311d449cebea7eb27e1a1593GameLevelMapData", Tuple.Create("map_unlock_hub", "New Kunlun Control Hub", "GameLevelMapData") );

  // Map Unlock:  Power Reservoir
  vars.gameFlags.Add("4adb7585036fd48a0a2868ea719fb329GameLevelMapData", Tuple.Create("map_unlock_reservoir", "Central Transport Hub", "GameLevelMapData") );
  vars.gameFlags.Add("74a699f7b6c6e44b5bd90db491c2e625GameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (East)", "GameLevelMapData") );
  vars.gameFlags.Add("e587381daf2bd4b7fa349239ef68a3fbGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (Central)", "GameLevelMapData") );
  vars.gameFlags.Add("421b37992e6364d9fa83de4d85cc037eGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (West)", "GameLevelMapData") );
  vars.gameFlags.Add("cdeee1168f485e74887d0fe58c43681eGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Radiant Pagoda", "GameLevelMapData") );

  // Map Unlock: Agricultural Zone
  vars.gameFlags.Add("9cc919f329be2405dada15762d5332b4GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Lake Yaochi Ruins", "GameLevelMapData") );
  vars.gameFlags.Add("744ab7b9ed08a405ea3b4cb036ffdcacGameLevelMapData", Tuple.Create("map_unlock_agricultural", "Greenhouse", "GameLevelMapData") );
  vars.gameFlags.Add("6c2a22089e6da4355992a205f3ecdfe2GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Water & Oxygen Synthesis", "GameLevelMapData") );
  vars.gameFlags.Add("0de4247fc506d4d8dbd9af186ed54dbeGameLevelMapData", Tuple.Create("map_unlock_agricultural", "Yinglong Canal", "GameLevelMapData") );
  vars.gameFlags.Add("bc9ddef07c1e646a294e14745f0046f8GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Agrarian Hall", "GameLevelMapData") );

  // Map Unlock: Warehouse Zone
  vars.gameFlags.Add("56bbbc379774e3f47b1be9aaecae0b2aGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Outer Warehouse", "GameLevelMapData") );
  vars.gameFlags.Add("0626b4332cff9a04ea51ae1f645a0d3dGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Inner Warehouse", "GameLevelMapData") );
  vars.gameFlags.Add("7ef7c38a76eabc54384407e924a0b730GameLevelMapData", Tuple.Create("map_unlock_warehouse", "Boundless Repository (Entrance)", "GameLevelMapData") );
  vars.gameFlags.Add("11ff35b24567fa343b857b647ba2668eGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Boundless Repository (Inside)", "GameLevelMapData") );
  vars.gameFlags.Add("7596f07b1a945444188499c708c71a1bGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Claw Room", "GameLevelMapData") );
  vars.gameFlags.Add("1284f6d249c6cd44fb48ca86ec8f6977GameLevelMapData", Tuple.Create("map_unlock_warehouse", "Yangu Hall", "GameLevelMapData") );

  // Map Unlock: Abandoned Mines (Zone)
  vars.gameFlags.Add("23257e47847f7484e823915fe7386576GameLevelMapData", Tuple.Create("map_unlock_mines", "Factory (Underground)", "GameLevelMapData") );
  vars.gameFlags.Add("a69792854844a0d4da78200efd6c3975GameLevelMapData", Tuple.Create("map_unlock_mines", "Abandoned Mines (Location)", "GameLevelMapData") );

  // Map Unlock: Livestock Area
  vars.gameFlags.Add("61d15845d3cb94b548b08824a799151fGameLevelMapData", Tuple.Create("map_unlock_livestock", "Underground Cave", "GameLevelMapData") );
  vars.gameFlags.Add("faf89d9b9b6b1496bba3a6e7c5ab9b87GameLevelMapData", Tuple.Create("map_unlock_livestock", "95th Livestock Pen", "GameLevelMapData") );
  vars.gameFlags.Add("f15bfb246c722428fb4eee0c3b7f82c8GameLevelMapData", Tuple.Create("map_unlock_livestock", "Livestock Harvesting Platform", "GameLevelMapData") );
  vars.gameFlags.Add("26eb02f24e33f4bbb8d6796b4536b7eeGameLevelMapData", Tuple.Create("map_unlock_livestock", "Galactic Dock", "GameLevelMapData") );

  // Map Unlock: Transmutation Zone
  vars.gameFlags.Add("c666721e0b9424246aa81fd37c5fbd2dGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Great Hall)", "GameLevelMapData") );
  vars.gameFlags.Add("51114c048273a42ce8d8fc76edba10aaGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Prison", "GameLevelMapData") );
  vars.gameFlags.Add("c74093ff6ef0c984d98d82ecabdf6badGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Machine Room)", "GameLevelMapData") );
  vars.gameFlags.Add("b9bf8897ef19a4daf8803979a9e59cf7GameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Production Area)", "GameLevelMapData") );
  vars.gameFlags.Add("ac5fbcf2517b94389b3f4a41fa1cce06GameLevelMapData", Tuple.Create("map_unlock_transmutation", "Shengwu Hall", "GameLevelMapData") );

  // Map Unlock: Central Core
  vars.gameFlags.Add("592b140bacb5a4079a77c071ac2df07eGameLevelMapData", Tuple.Create("map_unlock_centralcore", "Cortex Center", "GameLevelMapData") );
  vars.gameFlags.Add("4727637957ed4d74ebc6d4697a9df90cGameLevelMapData", Tuple.Create("map_unlock_centralcore", "Lady Ethereal's Soulscape", "GameLevelMapData") );
  vars.gameFlags.Add("f1c9ab9f-0e22-4105-8267-54e4b2a68572_93653f615d5940a409fffdcecb72ec43ScriptableDataBool", Tuple.Create("map_unlock_centralcore", "Lady Ethereal Butterfly Segment", "ScriptableDataBool") );

  // Map Unlock: Empyrean District
  vars.gameFlags.Add("5a29d1bfe51aa470ea7021414fa4e21bGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Sky Tower", "GameLevelMapData") );
  vars.gameFlags.Add("e8a25a5db46b8420ba9d35eb15ae52dfGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean District (Passages)", "GameLevelMapData") );
  vars.gameFlags.Add("0fe1c121c3ffe40d48ec7a1b3549b764GameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean District (Living Area)", "GameLevelMapData") );
  vars.gameFlags.Add("135eb5244f8364f5d9d2730cdcf1baf6GameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean Dist. (Sanctum)", "GameLevelMapData") );
  vars.gameFlags.Add("e0383e548585949dfb08a78da77da3baGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Nobility Hall", "GameLevelMapData") );

  // Map Unlock: Grotto of Scriptures
  vars.gameFlags.Add("870830f0908bd4a43a4d28423da262e4GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (Entry)", "GameLevelMapData") );
  vars.gameFlags.Add("dd671cd697ba07241ad0b84940dbe3f2GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (East)", "GameLevelMapData") );
  vars.gameFlags.Add("b0927634d15cba840badaaf7e98bd899GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (West)", "GameLevelMapData") );
  vars.gameFlags.Add("18a1f7553ca544723af90380184b3cafGameLevelMapData", Tuple.Create("map_unlock_grotto", "Ancient Stone Pillar", "GameLevelMapData") );

  // Map Unlock: Research Institute
  vars.gameFlags.Add("4b88e20fbe4db4e018bc7c51cfd06317GameLevelMapData", Tuple.Create("map_unlock_institute", "Tiandao Research Center", "GameLevelMapData") );
  vars.gameFlags.Add("004d9523761fd5b47935512baf84bbc3GameLevelMapData", Tuple.Create("map_unlock_institute", "Tianhuo Research Institute", "GameLevelMapData") );

  // Database: Character Entries
  vars.gameFlags.Add("f5e7051f307dcf448a40d1f36e99a63dEncyclopediaItem", Tuple.Create("characterentry_unlock", "Yi", "GameFlagDescriptable") );
  vars.gameFlags.Add("fb1b6921c130f7a44b4bde4de9f3698fEncyclopediaItem", Tuple.Create("characterentry_unlock", "Shuanshuan Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("755f00ff0abccd8489ffc74eb9b77116EncyclopediaItem", Tuple.Create("characterentry_unlock", "Shuanshuan Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("c43bc653acf552347acb74d53e36f1f3EncyclopediaItem", Tuple.Create("characterentry_unlock", "Shennong Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("00c585e0186d60a4285e01d2e7247f54EncyclopediaItem", Tuple.Create("characterentry_unlock", "Shennong Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("4836fa6e9e0c66c4c8238a9c50885468EncyclopediaItem", Tuple.Create("characterentry_unlock", "Abacus - Ruyi Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("3d369fe813678e24a8d91c175a49505eEncyclopediaItem", Tuple.Create("characterentry_unlock", "Abacus - Ruyi Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("04d90cc08ac4b904d8d627052439857cEncyclopediaItem", Tuple.Create("characterentry_unlock", "Shanhai 9000 Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("706f3711dce19e147a0e83f35d9f9024EncyclopediaItem", Tuple.Create("characterentry_unlock", "Shanhai 9000 Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("815214d30d5b64c40b1184883bbddaa7EncyclopediaItem", Tuple.Create("characterentry_unlock", "Chiyou Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("c478d9b800c7cfb4dabb584e51a95093EncyclopediaItem", Tuple.Create("characterentry_unlock", "Chiyou Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("478420773cf1ab84dbb99aef2df8653eEncyclopediaItem", Tuple.Create("characterentry_unlock", "Kuafu Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("72e94c0a930bb5a48a3de2e684cf3b81EncyclopediaItem", Tuple.Create("characterentry_unlock", "Kuafu Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("93a029bbcf4fd9b4ea61eb53931fbe3bEncyclopediaItem", Tuple.Create("characterentry_unlock", "Goumang Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("43e2a7c28741eb246adc04e3c2ac2137EncyclopediaItem", Tuple.Create("characterentry_unlock", "Goumang Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("e06a0508c554e2c4aa698e66b40c0a18EncyclopediaItem", Tuple.Create("characterentry_unlock", "Yanlao Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("2577d0caf88cf6d4daf729f1bde7e62cEncyclopediaItem", Tuple.Create("characterentry_unlock", "Yanlao Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("76d0ee9d9d884a844aeacf8fe02201c9EncyclopediaItem", Tuple.Create("characterentry_unlock", "Jiequan Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("45775bae9f4689746b9be23a6c8b1348EncyclopediaItem", Tuple.Create("characterentry_unlock", "Jiequan Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("4d5149d638b88a647a274d8c8f745884EncyclopediaItem", Tuple.Create("characterentry_unlock", "Lady Ethereal Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("e96389eb25422b84b8fd73c354700597EncyclopediaItem", Tuple.Create("characterentry_unlock", "Lady Ethereal Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("f3e032790926ac745ace8376465bf3e7EncyclopediaItem", Tuple.Create("characterentry_unlock", "Ji", "GameFlagDescriptable") );
  vars.gameFlags.Add("1b9040c1f1b414949a1e2a1d2b8f500cEncyclopediaItem", Tuple.Create("characterentry_unlock", "Fuxi Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("721bfd51913a6f745b8ba7a35fb6a350EncyclopediaItem", Tuple.Create("characterentry_unlock", "Fuxi Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("bcd7ab8fcb04fc14f8f95fe309dc6ffeEncyclopediaItem", Tuple.Create("characterentry_unlock", "Nuwa Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("cbaf77d66f16c0543bd57fbca88afcf4EncyclopediaItem", Tuple.Create("characterentry_unlock", "Nuwa Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("bcc8d5ccfad899043b0f7147ebe7a623EncyclopediaItem", Tuple.Create("characterentry_unlock", "Eigong Unlocked", "GameFlagDescriptable") );
  vars.gameFlags.Add("cfe769d63ebe1a3429f1838e2c401d1cEncyclopediaItem", Tuple.Create("characterentry_unlock", "Eigong Completed", "GameFlagDescriptable") );
  vars.gameFlags.Add("25ef42e93c6960741bd29655842bd29aEncyclopediaItem", Tuple.Create("characterentry_unlock", "Heng", "GameFlagDescriptable") );

  // Database: Encyclopedia
  vars.gameFlags.Add("cca1601f63325463ca56b28fba2ac3bbEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "01 - Dead Person's Note", "GameFlagDescriptable") );
  vars.gameFlags.Add("aef5b069abec5437e92be1d08e63855eEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "02 - Camp Scroll", "GameFlagDescriptable") );
  vars.gameFlags.Add("6f09dd55228d01f4797a1d3d8a5e0e61EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "03 - Apemen Surveillance Footage", "GameFlagDescriptable") );
  vars.gameFlags.Add("b5ca02d4c727444f0ab3da1b7fdfe198EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "04 - Council Digital Signage", "GameFlagDescriptable") );
  vars.gameFlags.Add("e2a7fbf9aeafc48328541c6abc72a464EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "05 - New Kunlun Launch Memorial", "GameFlagDescriptable") );
  vars.gameFlags.Add("c8087170a9ebe2440b88559f0a676921EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "06 - Anomalous Root Node", "GameFlagDescriptable") );
  vars.gameFlags.Add("d6a96d9595386364abf56c85bfa2a32eEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "07 - Rhizomatic Energy Meter", "GameFlagDescriptable") );
  vars.gameFlags.Add("e0c18d6fbe20fde449d1ae43ade87870EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "08 - Dusk Guardian Recording Device 1", "GameFlagDescriptable") );
  vars.gameFlags.Add("074b013e9264d486da7de635c2d3864dEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "09 - Radiant Pagoda Control Panel", "GameFlagDescriptable") );
  vars.gameFlags.Add("093afc7ff350d47dba3217da80b09eedEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "10 - Lake Yaochi Stele", "GameFlagDescriptable") );
  vars.gameFlags.Add("8bd01994a26d46343a21e8a6f7080634EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "11 - Ancient Cave Painting", "GameFlagDescriptable") );
  vars.gameFlags.Add("1b2ed9110ab548e42931345bfd984fedEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "12 - Coffin Inscription", "GameFlagDescriptable") );
  vars.gameFlags.Add("e3fd6e22b80be47ee97d69adbebe8baeEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "13 - Yellow Water Report", "GameFlagDescriptable") );
  vars.gameFlags.Add("88121ba0c1030408a974cf1d99140fd9EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "14 - Mutated Crops", "GameFlagDescriptable") );
  vars.gameFlags.Add("17858803e17337c4ba1cf7cd1c84836dEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "15 - Water Synthesis Pipeline Panel", "GameFlagDescriptable") );
  vars.gameFlags.Add("1e6bf4d86baa5f44b8a44a04ec64815aEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "16 - Dusk Guardian Recording Device 2", "GameFlagDescriptable") );
  vars.gameFlags.Add("196708902c61b4f0abc1e343c650c2e5EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "17 - Farmland Markings", "GameFlagDescriptable") );
  vars.gameFlags.Add("fe09efd3264ed492d9d97c69bcb68631EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "18 - Council Tenets", "GameFlagDescriptable") );
  vars.gameFlags.Add("101f4db545b3dc149bd83c575225fbc7EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "19 - Transmutation Furnace Monitor", "GameFlagDescriptable") );
  vars.gameFlags.Add("1eb714c43cdb548b3b18fab21847f561EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "20 - Evacuation Notice for Miners", "GameFlagDescriptable") );
  vars.gameFlags.Add("b7df8be887589d844b9e648acadbe1e2EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "21 - Warehouse Database", "GameFlagDescriptable") );
  vars.gameFlags.Add("409c0d8a55857f84b8d18218559f4869EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "22 - Dusk Guardian Recording Device 3", "GameFlagDescriptable") );
  vars.gameFlags.Add("fb3c0ab8f201840ef9126e088046f3fdEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "23 - Ancient Weapon Console", "GameFlagDescriptable") );
  vars.gameFlags.Add("a18f20b13ed394fb7bd7d50f0470a5f6EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "24 - Hexachrem Vault Scroll", "GameFlagDescriptable") );
  vars.gameFlags.Add("64ae4af6ad3ef8d48b38d38581fbeab5EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "25 - Prisoner's Bamboo Scroll (I)", "GameFlagDescriptable") );
  vars.gameFlags.Add("cff374c3e4499d74483e75665fb87d96EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "26 - Prisoner's Bamboo Scroll (II)", "GameFlagDescriptable") );
  vars.gameFlags.Add("044cbc32e4bad49bcadec39def818dd5EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "27 - Jie Clan Family Precept", "GameFlagDescriptable") );
  vars.gameFlags.Add("e12e50bede6add0498844441ca76d3aeEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "28 - Guard Production Station", "GameFlagDescriptable") );
  vars.gameFlags.Add("cdd0012ad4db39141a0af084460f4e2cEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "29 - Dusk Guardian Recording Device 4", "GameFlagDescriptable") );
  vars.gameFlags.Add("608c6830970fe4385aeac10ad290428cEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "30 - Pharmacy Panel", "GameFlagDescriptable") );
  vars.gameFlags.Add("7478f506316dd4eeb9dc2ef7d4dbb122EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "31 - Haotian Sphere Model", "GameFlagDescriptable") );
  vars.gameFlags.Add("cead86cbe2ec8a744b6c83d8d8e0a5e8EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "32 - Cave Stone Inscription", "GameFlagDescriptable") );
  vars.gameFlags.Add("80b4d0ed2190ed84da86efd425256c6cEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "33 - Galactic Dock Sign", "GameFlagDescriptable") );
  vars.gameFlags.Add("ce171afc4c3b69e439444abad643eae4EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "34 - Stone Carvings", "GameFlagDescriptable") );
  vars.gameFlags.Add("b2d9abd742ccba747846527fb995ecddEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "35 - Secret Mural I", "GameFlagDescriptable") );
  vars.gameFlags.Add("1a37c30f26f84074b90ec92bdf1197b2EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "36 - Secret Mural II", "GameFlagDescriptable") );
  vars.gameFlags.Add("cff31b90ae300f549bf00535703ced17EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "37 - Secret Mural III", "GameFlagDescriptable") );
  vars.gameFlags.Add("aaddc36fd468ac946919ea84f4623d75EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "38 - Stowaway's Corpse", "GameFlagDescriptable") );
  vars.gameFlags.Add("9f75430aa354b7946a7f65fc849684b4EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "39 - Underground Water Tower", "GameFlagDescriptable") );
  vars.gameFlags.Add("dd131993d18510b478a6f466ba366ffbEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "40 - Empyrean Bulletin Board", "GameFlagDescriptable") );
  vars.gameFlags.Add("c28736cb52917b549a11d6f63f6523e0EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "41 - Dusk Guardian Recording Device 5", "GameFlagDescriptable") );
  vars.gameFlags.Add("9b4658617a3e45a46baa1eb8d25fde8eEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "42 - Vital Sanctum Tower Monitoring Panel", "GameFlagDescriptable") );
  vars.gameFlags.Add("0a4b2b7fdfba0af4f82355e086d312caEncyclopediaItem", Tuple.Create("encyclopedia_unlock", "43 - Dusk Guardian Recording Device 6", "GameFlagDescriptable") );
  vars.gameFlags.Add("4e7c90d21f20f814aaacdbfb1d0cc857EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "44 - Dusk Guardian Headquarters Screen", "GameFlagDescriptable") );
  vars.gameFlags.Add("8acf8ff82f57b414887b68e127c7fee7EncyclopediaItem", Tuple.Create("encyclopedia_unlock", "45 - Root Core Monitoring Device", "GameFlagDescriptable") );

  // settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on existing Save");
  settings.SetToolTip("fileselect_start", "For starting timer when selecting any existing save. Don't use with new save file creation.");
  settings.Add("memories_start", false, "Start on Memories of Battle boss");
  settings.SetToolTip("memories_start", "For starting timer when starting a boss fight in Memories of Battle mode");
  settings.Add("memories_reset", false, "Reset on Memories of Battle retry");
  settings.SetToolTip("memories_reset", "For resetting timer when dying or pressing Retry in Memories of Battle (ILs)");

  settings.Add("ability_obtain", true, "Split on obtaining ability");
  foreach (var ability in vars.abilities) { 
    settings.Add(ability.Value, false, ability.Key, "ability_obtain"); 
  }

  // Add top level settings groupings for flags
  settings.Add("ability_exit", true, "Split on exiting Ability tutorial maps");
  settings.Add("seal_obtain", true, "Split on exiting a Sol's Soulscape room");
  settings.Add("item_obtain", true, "Split on obtaining an item");
  settings.Add("boss_kill", true, "Split on Boss Kill");
  settings.Add("rootnode_unlock", true, "Split on unlocking a root node");
  settings.Add("map_unlock", true, "Split on entering a new area");
  settings.Add("database_unlock", true, "Split on unlocking a database entry");

  // Item pickup sub-groupings
  settings.Add("keyitem_obtain", true, "Key Items", "item_obtain");
  settings.Add("jade_obtain", true, "Jades", "item_obtain");
  settings.Add("artifact_obtain", true, "Artifacts", "item_obtain");
  settings.Add("poison_obtain", true, "Poisons", "item_obtain");
  settings.Add("recyclable_obtain", true, "Recyclables", "item_obtain");
  settings.Add("mapchip_obtain", true, "Map Chips", "item_obtain");
  settings.Add("taofruit_obtain", true, "Tao Fruits", "item_obtain");
  settings.Add("darksteel_obtain", true, "Dark Steel", "item_obtain");
  settings.Add("bowupgrade_obtain", true, "Bow Upgrades", "item_obtain");
  settings.Add("computingunit_obtain", true, "Computing Units", "item_obtain");
  settings.Add("pipevial_obtain", true, "Pipe Vials", "item_obtain");
  settings.Add("herbcatalyst_obtain", true, "Herb Catalysts", "item_obtain");
  settings.Add("pipeupgrade_obtain", true, "Pipe Upgrades", "item_obtain");

  // Boss kill sub-groupings
  settings.Add("mainboss_kill", true, "Main Bosses", "boss_kill");
  settings.Add("miniboss_kill", true, "Mini Bosses", "boss_kill");

  // Database sub-groupings
  settings.Add("characterentry_unlock", true, "Character Entries", "database_unlock");
  settings.Add("encyclopedia_unlock", true, "Encyclopedia Entries", "database_unlock");
  
  // Groupings for map unlock sub-areas
  settings.Add("map_unlock_apeman", true, "Apeman Facility", "map_unlock");
  settings.Add("map_unlock_hub", true, "New Kunlun Hub", "map_unlock");
  settings.Add("map_unlock_reservoir", true, "Power Reservoir", "map_unlock");
  settings.Add("map_unlock_agricultural", true, "Agricultural Zone", "map_unlock");
  settings.Add("map_unlock_warehouse", true, "Warehouse Zone", "map_unlock");
  settings.Add("map_unlock_mines", true, "Abandoned Mines", "map_unlock");
  settings.Add("map_unlock_livestock", true, "Livestock Area", "map_unlock");
  settings.Add("map_unlock_transmutation", true, "Transmutation Zone", "map_unlock");
  settings.Add("map_unlock_centralcore", true, "Central Core", "map_unlock");
  settings.Add("map_unlock_empyrean", true, "Empyrean District", "map_unlock");
  settings.Add("map_unlock_grotto", true, "Grotto of Scriptures", "map_unlock");
  settings.Add("map_unlock_institute", true, "Research Institute", "map_unlock");
  
  // Add individual flag settings
  foreach (var flagEntry in vars.gameFlags) {
    settings.Add(flagEntry.Key, false, flagEntry.Value.Item2, flagEntry.Value.Item1);
  }

  settings.Add("mob_kill", true, "Split on Battle Memories Boss Kill");
  foreach (var boss in vars.memoriesOfBattleBosses) { 
    settings.Add(boss.Value, false, boss.Key, "mob_kill"); 
  }
}

init
{
  current.SceneIndex = 0;
  current.Scene = "";
  current.bossPostureSystem = 0;
  current.bossHPBar = 0;
  current.bossPhase = 0;

  current.JiFix = false;

  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {
      vars.mono = mono;

      var AppCore = mono["ApplicationCore",1];
      var GameCore = mono["GameCore",1];
      var ApplicationUIGroupManager = mono["ApplicationUIGroupManager", 1];
      var SaveManager = mono["SaveManager",1];
      var ConfigManager = mono["ConfigManager", 1];
      var CheatManager = mono["CheatManager", 1];

      if(vars.Helper.Scenes.Active.Index == 0)
      {
          print("Active scene is loading scene. Won't try to start now.");
          return false;
      }
      
      vars.cameraManagerInitialized = false;
      vars.monsterManagerInitialized = false;

      vars.Helper["loadingscreen"] = AppCore.Make<bool>("_instance","loadingScreen",0x78); // When loading screen is active
      // vars.Helper["levelloading"] = GameCore.Make<bool>("_instance","gameLevel",0x1b8);  // When level is finishing the load, currently not in use
      vars.Helper["gamestate"] = GameCore.Make<int>("_instance","_currentCoreState"); //wow there was an actual loading state
      vars.Helper["YiHP"] = GameCore.Make<float>("_instance","player",0x470,0x94); 

      vars.Helper["savefilestart"] = AppCore.Make<bool>("_instance","IsPlayFromTitleScreen"); 

      //vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","gameModeFlag"); 
      
      vars.Helper["blackCoverOpacity"] = ApplicationUIGroupManager.Make<float>("_instance", "blackCover", 0x70 + 0xc); // ApplicationUIGroupManager.blackCover.m_color.a

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
      //vars.Helper["SlowMotion"] = mono["TimePauseManager",1].Make<float>("_instance","gamePlayTimeScaleModifier", 0x30); 
      // vars.Helper["PhaseIndex"] = GameCore.Make<int>("_instance","player", 0x4c8,0x418); 

      vars.Helper["bossHPUIList"] = GameCore.MakeList<IntPtr>("_instance", "monsterHpUI", 0x40); 
      
       /* Flags */
      var AllFlags = vars.Helper.ReadList<IntPtr>(SaveManager.Static + SaveManager["_instance"], SaveManager["allFlags"], 0x18);
      if(AllFlags.Count == 0) {
         print("allFlags count was 0. Wait for allFlags to be initialized.");
         return false;
      }

      vars.mobFlagExists = false;
      vars.FoundFlags = new HashSet<string>();
      vars.FoundMerchandiseData = new HashSet<string>();
      foreach(IntPtr FlagPtr in AllFlags) {
         if(FlagPtr == IntPtr.Zero) {
             print("Flag was null. Waiting for all flags to be initialized before starting");
             return false;
         }

         IntPtr finalSaveIDPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x20);
         if(finalSaveIDPtr == IntPtr.Zero)
         {
             print("Flag was not initialized. Waiting for all flags to be initialized before starting.");
             return false;
         }
         
         //GameFlagBase._finalSaveID
         string finalSaveID = vars.Helper.ReadString(256, ReadStringType.AutoDetect, FlagPtr + 0x20, 0x14);
         
         if(vars.gameFlags.ContainsKey(finalSaveID)) {
            string className = vars.gameFlags[finalSaveID].Item3;
            if(className == "GameFlagDescriptable") {
               //GameFlagDescriptable.acquired
               //IntPtr acquiredFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x48);

               //GameFlagDescriptable.unlocked
               IntPtr unlockedFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x40);
               
               //GameFlagDescriptable.unlocked._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(unlockedFieldPtr + 0x3a);
               
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "ScriptableDataBool") {
               //ScriptableDataBool.field
               IntPtr fieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x38);
                  
               //ScriptableDataBool.field._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(fieldPtr + 0x3a);
                  
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "GameLevelMapData") {
               //GameLevelMapData.unlocked
               IntPtr unlockedFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x68);
                  
               //GameLevelMapData.unlocked._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(unlockedFieldPtr + 0x3a);
                  
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "MerchandiseData") {
               //MerchandiseData.numLeftToBuy
               IntPtr numLeftFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x188);
               
               //MerchandiseData.numLeftToBuy._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<int>(numLeftFieldPtr + 0x40);
               
               vars.FoundMerchandiseData.Add(finalSaveID);
            }
         }
         
         // Special case: Store the flag that tells us if we're currently in Memories of Battle
         if(finalSaveID == "3173df12f14fc4862bf4588193b8cfc3ScriptableDataBool") { 
               //ScriptableDataBool.field
               IntPtr fieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x38);
                  
               //ScriptableDataBool.field._currentValue;
               vars.Helper["MemoriesOfBattleFlag"] = vars.Helper.Make<bool>(fieldPtr + 0x3a);
               vars.mobFlagExists = true;
         }
      }
      
      return true;
   });
}

start {
  if(settings["memories_start"] && vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
    // If the BossHPList is not empty, get the current boss HP on fight start to trigger auto-start for ILs
    if (vars.Helper["bossHPUIList"].Current.Count != vars.Helper["bossHPUIList"].Old.Count 
        && vars.Helper["bossHPUIList"].Current.Count >= vars.Helper["bossHPUIList"].Old.Count) { 

      // Cheap fix for Ji fight auto-start
      if (current.SceneIndex == 0 && current.JiFix == false) {
        current.JiFix = true;
        return false;
      }

      // print("START MOB: " +  vars.Helper["bossHPUIList"].Current.Count + " - " + vars.Helper["bossHPUIList"].Old.Count);
      return true;
    }
    // Jiequan detection fix, start on detecting a change in the closetMonster pointer and if the HP is jiequan's max MoB HP
    if (vars.monsterManagerInitialized && current.SceneIndex == 41 && vars.Helper["closetMonster"] != null && vars.Helper["closetMonster"].Current != vars.Helper["closetMonster"].Old && vars.Helper["currentEnemyPosture"].Current == 5400) 
    { 
      return true;
      // print("Start Jiequan: " + vars.Helper["currentEnemyPosture"].Current + " " + current.bossPostureSystem);
    }
  }

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
  current.JiFix = false;

  vars.fileSelectStartTimer = new System.Diagnostics.Stopwatch();
  vars.fileSelectStartTimer.Start();
}

isLoading
{
  return (vars.Helper["loadingscreen"].Current 
  || (vars.Helper["gamestate"].Current == 2) 
  || (current.SceneIndex == 0)
  || (current.SceneIndex == 72) 
  || (current.SceneIndex == 7)
  || (current.SceneIndex == 1 && vars.Helper["blackCoverOpacity"].Current > 0.99f)
  || (current.SceneIndex == 1 && vars.fileSelectStartTimer.ElapsedMilliseconds < 1000));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;

  if(old.SceneIndex != current.SceneIndex) { 
    // dirty fix for Ji autostart
    if (current.SceneIndex == 88) { current.JiFix = false;  }
    
    // jiequan HP detection fix reset on scene change
    if (current.SceneIndex == 41) { current.bossPostureSystem = 0; }
  }  

  // MoB HP detection updates
  if(vars.monsterManagerInitialized && vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
    if (current.SceneIndex == 41) {  
      // jiequan HP detection
      current.bossPostureSystem = vars.Helper["currentEnemyPosture"].Current; 
    } 
    else { 
      // Go through the boss HP list and store the current posture system HP value
      // GameCore -> UIMonsterHPManager -> bossHPList<UIBossHP> (destruct)
      current.bossPostureSystem = 0;
      foreach(IntPtr BossHPUI in vars.Helper["bossHPUIList"].Current) {
        IntPtr BossPosture = vars.Helper.Read<IntPtr>(BossHPUI + 0x70);
        current.bossHPBar = vars.Helper.Read<float>(BossHPUI + 0xa4);

        // UIBossHP -> PostureSystem -> _value
        current.bossPostureSystem = vars.Helper.Read<float>(BossPosture + 0x94); 

        // UIBossHP -> PostureSystem -> bindMonster (MonsterBase) -> phaseIndex
        current.bossPhase = vars.Helper.Read<int>(BossPosture + 0x30 + 0x448);
      }
    }
  }

  if(vars.cameraManagerInitialized) {
    current.cameraHighlightTime = vars.Helper.Read<float>(vars.Helper["currentCameraCore"].Current + 0xcc);
    current.cameraHighlightEnabled = vars.Helper.Read<bool>(vars.Helper["currentCameraCore"].Current + 0xb0, 0x20);
  }

  // Try to initialize the camera if it isn't initialized yet. We can't do it in init because the camera manager isn't initialized before loading a save for the first time
  if(!vars.cameraManagerInitialized)
  {
    try{
      var CameraManager = vars.mono["CameraManager",1];
      vars.Helper["currentCameraCore"] = CameraManager.Make<IntPtr>("_instance", "currentCameraCore");

      current.cameraHighlightTime = 0.0f;
      current.cameraHighlightEnabled = false;

      vars.cameraManagerInitialized = true;
      print("Camera Manager Initialized success");
    }
    catch{
      // CameraManager not loaded yet
    }
  }

  // Try to initialize the MonsterManager if it isn't initialized yet. We can't do it in init because the monster manager isn't initialized before loading a save for the first time
  if(!vars.monsterManagerInitialized)
  {
    try{
      var MonsterManager = vars.mono["MonsterManager",1];
      // Closest monster check for Jiequan
      if (vars.mobFlagExists) {
        vars.Helper["closetMonster"] = MonsterManager.Make<IntPtr>("_instance","_closetMonster");
        vars.Helper["currentEnemyPosture"] = MonsterManager.Make<float>("_instance","_closetMonster",0x3d0,0x94); 
      }
      
      vars.monsterManagerInitialized = true;
      print("Monster Manager Initialized success");
    }
    catch{
      // MonsterManager not loaded yet
    }
  }
}

reset 
{
//   if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1) { return true; }

  // Reset on retry for ILs
  if (settings["memories_reset"] && vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current && vars.Helper["YiHP"].Current <= 0) { 
    return true; 
  }
}

split {
    // Don't trigger any splits that check game flags when we're on the main menu
    // These flags could contain values from previously loaded saves, resulting in splits being triggered when starting a run
    if(current.SceneIndex != 1)
    {
      /* Split on Ability obtain (on the first triggers) */ 
      foreach (var ability in vars.abilities) {
        if(settings[ability.Value] && !vars.CompletedSplits.Contains(ability.Value)) {
          if (vars.Helper[ability.Value].Current) {
            print("splitting for: " + ability);
            vars.CompletedSplits.Add(ability.Value);
            return true;
          }
        }
      }
    
      /* Split on Game Flag being set */
      foreach (var saveFlagID in vars.FoundFlags) {
        if (settings[saveFlagID] && !vars.CompletedSplits.Contains(saveFlagID)) {
          if (vars.Helper[saveFlagID].Current) {
            print("splitting for flag: " + vars.gameFlags[saveFlagID].Item1 + " - " + vars.gameFlags[saveFlagID].Item2);
            vars.CompletedSplits.Add(saveFlagID);
            return true;
          }
        }
      }
    
      /* Split on MerchandiseData.numLeftToBuy dropping to 0 */
      foreach (var saveFlagID in vars.FoundMerchandiseData) {
        if (settings[saveFlagID] && !vars.CompletedSplits.Contains(saveFlagID)) {
          if (vars.Helper[saveFlagID].Current == 0) {
            print("splitting for flag: " + vars.gameFlags[saveFlagID].Item1 + " - " + vars.gameFlags[saveFlagID].Item2);
            vars.CompletedSplits.Add(saveFlagID);
            return true;
          }
        }
      }
    }

    /* Split on Memories of Battle Boss Kill (experimental)
      Camera LastHitHighlight is the black and white effect on kill, and its time is set to 2f when the effect goes on screen. It has a HighlightCamera.enabled property i havent seen how to obtain yet.
      This would grab that duration as the trigger and also check if the boss has less than 1 HP for certain cases where it ends at less than 0.5 HP and fully dies after the black and white */
    if(vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
      if (vars.cameraManagerInitialized && current.cameraHighlightTime > 1.5 && current.bossPostureSystem <= 1)  {
        foreach (var boss in vars.memoriesOfBattleBosses) {
          if (current.SceneIndex == vars.roomIndexes[boss.Value]) {
            if (settings[boss.Value] && !vars.CompletedSplits.Contains(boss.Value)) {
              print("splitting for: " + boss);
              print("Boss posture system value: " + current.bossPostureSystem);
              vars.CompletedSplits.Add(boss.Value);
              return true;
            }
          }
        }
      }
    }

    return false;
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