import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:bala_aksharam/utils/app_theme.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Little Rishis", style: GoogleFonts.nunito()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            tooltip: "Settings",
            onPressed: () => Navigator.of(context).pushNamed("/settings"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreeting(),
            const SizedBox(height: 28),
            _buildSectionTitle("Learn Alphabets"),
            const SizedBox(height: 16),
            _buildAlphabetGrid(),
            const SizedBox(height: 28),
            _buildSectionTitle("Games & Activities"),
            const SizedBox(height: 16),
            _buildActivityGrid(),
            const SizedBox(height: 28),
            _buildSectionTitle("Ramayana Stories"),
            const SizedBox(height: 16),
            _buildStoryRow(),
            const SizedBox(height: 28),
            _buildDailyQuote(context),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.primarySaffron,
            AppTheme.lotusPinkDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primarySaffron.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.white,
            ),
            child: const Icon(
              Icons.volunteer_activism_rounded,
              size: 32,
              color: AppTheme.primarySaffron,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, Rishi!",
                  style: GoogleFonts.nunito(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Ready to learn today?",
                  style: GoogleFonts.nunito(
                    color: AppTheme.offWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.star_rounded,
                color: AppTheme.divineGoldLight,
                size: 32,
              ),
              Text(
                "12 ⭐",
                style: GoogleFonts.nunito(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppTheme.textPrimary,
      ),
    );
  }

  Widget _buildAlphabetGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.85,
      ),
      itemCount: 26,
      itemBuilder: (context, index) {
        final letter = String.fromCharCode(65 + index);
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/alphabet/$letter");
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primarySaffronLight.withOpacity(0.85),
                  AppTheme.lotusPinkLight.withOpacity(0.85),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primarySaffron.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                letter,
                style: GoogleFonts.nunito(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActivityGrid() {
    final activities = [
      {
        "icon": Icons.extension_rounded,
        "label": "Puzzle",
        "color": AppTheme.primaryKrishna,
        "route": "/puzzle",
      },
      {
        "icon": Icons.quiz_rounded,
        "label": "Quiz",
        "color": AppTheme.peacockGreen,
        "route": "/quiz",
      },
      {
        "icon": Icons.menu_book_rounded,
        "label": "Stories",
        "color": AppTheme.lotusPinkDark,
        "route": "/stories",
      },
      {
        "icon": Icons.emoji_events_rounded,
        "label": "Rewards",
        "color": AppTheme.sandalwood,
        "route": "/rewards",
      },
      {
        "icon": Icons.people_alt_rounded,
        "label": "Parent",
        "color": AppTheme.lotusPink,
        "route": "/parent",
      },
      {
        "icon": Icons.sports_esports_rounded,
        "label": "Games",
        "color": AppTheme.peacockBlue,
        "route": "/games",
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(activity["route"] as String),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              gradient: LinearGradient(
                colors: [
                  (activity["color"] as Color).withOpacity(0.1),
                  (activity["color"] as Color).withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: (activity["color"] as Color).withOpacity(0.2),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (activity["color"] as Color).withOpacity(0.12),
                  ),
                  child: Icon(
                    activity["icon"] as IconData,
                    size: 30,
                    color: activity["color"] as Color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  activity["label"] as String,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStoryRow() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final titles = [
            "Sita & Golden Deer",
            "Hanuman's Bridge",
            "Little Krishna",
          ];
          return Container(
            margin: EdgeInsets.only(right: index < 2 ? 14 : 0),
            width: 150,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppTheme.divineGold,
                  AppTheme.sandalwood,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.sandalwood.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: AppTheme.white,
                      size: 26,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    titles[index],
                    style: GoogleFonts.nunito(
                      color: AppTheme.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDailyQuote(BuildContext context) {
    const quotes = [
      "Be brave like Hanuman.",
      "Kindness is always beautiful.",
      "Do good without expecting.",
    ];
    final quote = quotes[0];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.divineGold.withOpacity(0.4),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.divineGold.withOpacity(0.15),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.marigoldYellowLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "💡",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Dharma",
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primarySaffron,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\"$quote\"",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
