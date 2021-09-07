from django.http.response import HttpResponse
from django.shortcuts import get_object_or_404

from rest_framework import status, viewsets
from rest_framework.response import Response

from .serializers import BucketSerializer, GoalSerializer
from .models import Bucket, Goal
from .utils import Utils
from .Exceptions import UserNotFoundError, InvalidRequestError

# TODO: remove
def index(request):
    return HttpResponse("Hello, world. You're at the main index.")

class BucketViewSet(viewsets.ModelViewSet):
    queryset = Bucket.objects.all()
    serializer_class = BucketSerializer

    def serialize_queryset(self, data):
        serializer = self.serializer_class(data, many=True)
        return serializer.data

    def validate_serializer(self, serializer):
        # TODO: should replace with raiseException=True
        if serializer.is_valid():
            return
        raise InvalidRequestError(message="Request is invalid")

    def create(self, request):
        try:
            # TODO: verify user attr is the same as logged in user
            Utils.get_user_from_request(request)
            serializer = self.serializer_class(data=request.data)
            self.validate_serializer(serializer)
        except (UserNotFoundError, InvalidRequestError) as err:
             return Utils.get_error_response(err)

        Bucket.objects.create(**serializer.validated_data)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def list(self, request):
        user = None
        try:
            user = Utils.get_user_from_request(request)
        except UserNotFoundError as err:
            return Utils.get_error_response(err)

        buckets_data = Bucket.objects.filter(user=user).all()
        serialized_data = self.serialize_queryset(buckets_data)
        return Response(serialized_data, status=status.HTTP_200_OK)

    def retrieve(self, request, pk=None):
        user = None
        try:
            user = Utils.get_user_from_request(request)
        except UserNotFoundError as err:
            return Utils.get_error_response(err)

        queryset = Bucket.objects.filter(user=user)
        bucket = get_object_or_404(queryset, pk=pk)
        serializer = self.serializer_class(bucket)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        user = None
        try:
            user = Utils.get_user_from_request(request)
        except UserNotFoundError as err:
            return Utils.get_error_response(err)

        partial = kwargs.get('partial', False)
        pk = kwargs.get('pk', None)
        queryset = Bucket.objects.filter(user=user)
        bucket = get_object_or_404(queryset, pk=pk)

        serializer = self.get_serializer(bucket, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(bucket, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the bucket.
            bucket._prefetched_objects_cache = {}

        return Response(serializer.data)

class GoalViewSet(viewsets.ModelViewSet):
    queryset = Goal.objects.all()
    serializer_class = GoalSerializer