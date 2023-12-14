part of './widgets.dart';

class TicketTile extends StatefulWidget {
  const TicketTile(
      {super.key,
      required double width,
      required this.ticket,
      required this.onPressed,
      this.leading = false});

  final Ticket ticket;
  final VoidCallback onPressed;
  final bool leading;

  @override
  State<TicketTile> createState() => TicketTileState();
}

class TicketTileState extends State<TicketTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black45,
      child: ListTile(
        onTap: () => widget.onPressed(),
        tileColor: const Color(0xff393e46),
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        leading: FractionallySizedBox(
          heightFactor: 1.735,
          child: Image.network(
            widget.ticket.film.thumbnailUrl!,
            fit: BoxFit.cover,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.ticket.film.title!,
            style: const TextStyle(
              color: Color.fromRGBO(253,1,120, 1),
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.ticket.time,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.ticket.cinema,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
        trailing: null,
      ),
    );
  }
}
