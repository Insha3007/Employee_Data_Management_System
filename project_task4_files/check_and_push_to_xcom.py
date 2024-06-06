import boto3
from datetime import datetime, timedelta, timezone
from airflow.models import XCom

def check_s3_files(bucket_name, prefix):
    print("Checking S3 for files...")
    today = datetime.now(timezone.utc)
    today_start = datetime(today.year, today.month, today.day, 0, 0, 0, tzinfo=timezone.utc)
    today_end = datetime(today.year, today.month, today.day, 7, 0, 0, tzinfo=timezone.utc)
    s3_client = boto3.client('s3')
    response = s3_client.list_objects_v2(Bucket=bucket_name, Prefix=prefix)
    keys = [obj['Key'] for obj in response.get('Contents', []) if today_start <= obj['LastModified'] <= today_end]
    if keys:
        print("Files found within the time interval.")
        return "yes"
    else:
        print("No files found within the time interval.")
        return "no"

def check_and_push_to_xcom(**kwargs):
    bucket_name = 'ttn-de-bootcamp-2024-gold-us-east-1'
    prefix = 'insha.danish/data/emp_leave_data/'
    result = check_s3_files(bucket_name, prefix)
    kwargs['ti'].xcom_push(key='file_found', value=result)

if __name__ == "__main__":
    check_and_push_to_xcom()
