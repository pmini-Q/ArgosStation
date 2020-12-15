#define SKILL_NONE     1
#define SKILL_BASIC    2
#define SKILL_ADEPT    3
#define SKILL_EXPERT   4
#define SKILL_PROF     5
#define HAS_PERK       SKILL_NONE + 1

#define SKILL_MIN      1 // Min skill value selectable
#define SKILL_MAX      5 // Max skill value selectable
#define SKILL_DEFAULT  4 //most mobs will default to this

#define SKILL_EASY     1
#define SKILL_AVERAGE  2
#define SKILL_HARD     4

#define SKILL_HAULING       /decl/hierarchy/skill/physical/hauling
#define SKILL_COMBAT        /decl/hierarchy/skill/physical/combat
#define SKILL_EVA           /decl/hierarchy/skill/physical/EVA
#define SKILL_BOTANY        /decl/hierarchy/skill/general/botany
#define SKILL_CONSTRUCTION  /decl/hierarchy/skill/general/construction
#define SKILL_COMPUTER      /decl/hierarchy/skill/general/computer
#define SKILL_ELECTRICAL    /decl/hierarchy/skill/general/electrical
#define SKILL_PILOT         /decl/hierarchy/skill/general/pilot
#define SKILL_MECH          /decl/hierarchy/skill/general/pilot/mech
#define SKILL_BUREAUCRACY   /decl/hierarchy/skill/clerical/bureaucracy
#define SKILL_FINANCE       /decl/hierarchy/skill/clerical/finance
#define SKILL_COOKING       /decl/hierarchy/skill/culinary/cooking
#define SKILL_MIXOLOGY		/decl/hierarchy/skill/culinary/mixology
#define SKILL_FORENSICS     /decl/hierarchy/skill/security/forensics
#define SKILL_WEAPONS       /decl/hierarchy/skill/security/weapons
#define SKILL_ATMOS         /decl/hierarchy/skill/engineering/atmos
#define SKILL_ENGINES       /decl/hierarchy/skill/engineering/engines
#define SKILL_MEDICAL       /decl/hierarchy/skill/medsci/medical
#define SKILL_SCIENCE       /decl/hierarchy/skill/medsci/science
#define SKILL_ANATOMY       /decl/hierarchy/skill/medsci/anatomy
#define SKILL_DEVICES       /decl/hierarchy/skill/medsci/devices
#define SKILL_CHEMISTRY     /decl/hierarchy/skill/medsci/chemistry