import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PartnerinTimelineTile extends StatefulWidget {
  final bool? isStart, isEnd, isCompleted;
  final String title, date, time;

  PartnerinTimelineTile({
    this.isStart,
    this.isEnd,
    this.isCompleted,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  _PartnerinTimelineTileState createState() => _PartnerinTimelineTileState();
}

class _PartnerinTimelineTileState extends State<PartnerinTimelineTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        hasIndicator: true,
        indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          indicator: CircleAvatar(
            backgroundColor:
                widget.isCompleted ?? false ? Colors.green : Colors.grey,
            child: Icon(
              Icons.check,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        endChild: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.date,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w200,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    widget.time,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w200,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isFirst: widget.isStart ?? false,
        isLast: widget.isEnd ?? false,
      ),
    );
  }
}
