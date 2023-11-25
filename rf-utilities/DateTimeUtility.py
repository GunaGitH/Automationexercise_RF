from datetime import datetime

def Print_Dates(dates):
    for i in range(len(dates)):
        print(dates[i])

def Sort_Dates(dates):
    dates.sort(key=lambda date: datetime.strptime(date, '%m/%d/%y'), reverse=True)
    Print_Dates(dates)
    return dates
